import 'dart:async';

import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return PlainScreen(
      child: Column(
        children: [
          Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(child: Text(MetaText.newChat)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text(MetaText.addToHomeScreen),
                    value: MetaText.addToHomeScreen,
                  ),
                  PopupMenuItem(
                    child: Text(MetaText.syncNotes),
                    value: MetaText.syncNotes,
                  ),
                  PopupMenuItem(
                    child: Text(MetaText.settings),
                    value: MetaText.settings,
                  ),
                ];
              },
            )
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            child: Row(
              children: [
                Text(MetaText.to),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChipsInput<String>(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Profile search'),
                        onChanged: _onChanged,
                        chipBuilder: (BuildContext context,
                            ChipsInputState<String> state,
                            String profile) {
                          return InputChip(
                            key: ObjectKey(profile),
                            label: Text(profile),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white24,
                              child: Padding(
                                padding: const EdgeInsets.all(3.5),
                                child: Icon(Icons.person),
                              )
                            ),
                            onDeleted: () => state.deleteChip(profile),
                            onSelected: (_) => _onChipTapped(profile),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onChipTapped(String profile) {
    print('$profile');
  }

  void _onChanged(List<String> data) {
    print('onChanged $data');
  }
}

typedef ChipSelected<T> = void Function(T data, bool selected);
typedef ChipsBuilder<T> = Widget Function(BuildContext context, ChipsInputState<T> state, T data);

class ChipsInput<T> extends StatefulWidget {
  const ChipsInput({
    Key key,
    this.decoration = const InputDecoration(),
    @required this.chipBuilder,
    @required this.onChanged,
    this.onChipTapped,
  }) : super(key: key);

  final InputDecoration decoration;
  final ValueChanged<List<T>> onChanged;
  final ValueChanged<T> onChipTapped;
  final ChipsBuilder<T> chipBuilder;

  @override
  ChipsInputState<T> createState() => ChipsInputState<T>();
}

class ChipsInputState<T> extends State<ChipsInput<T>> implements TextInputClient {
  static const kObjectReplacementChar = 0xFFFC;

  Set<T> _chips = Set<T>();

  FocusNode _focusNode;
  TextEditingValue _value = TextEditingValue();
  TextInputConnection _connection;

  String get text => String.fromCharCodes(
        _value.text.codeUnits.where((ch) => ch != kObjectReplacementChar),
      );

  bool get _hasInputConnection => _connection != null && _connection.attached;

  void requestKeyboard() {
    if (_focusNode.hasFocus) {
      _openInputConnection();
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  void selectSuggestion(T data) {
    setState(() {
      _chips.add(data);
      _updateTextInputState();
    });
    widget.onChanged(_chips.toList(growable: false));
  }

  void deleteChip(T data) {
    setState(() {
      _chips.remove(data);
      _updateTextInputState();
    });
    widget.onChanged(_chips.toList(growable: false));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _openInputConnection();
    } else {
      _closeInputConnectionIfNeeded();
    }
    setState(() {
      // rebuild so that _TextCursor is hidden.
    });
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    _closeInputConnectionIfNeeded();
    super.dispose();
  }

  void _openInputConnection() {
    if (!_hasInputConnection) {
      _connection = TextInput.attach(this, TextInputConfiguration());
      _connection.setEditingState(_value);
    }
    _connection.show();
  }

  void _closeInputConnectionIfNeeded() {
    if (_hasInputConnection) {
      _connection.close();
      _connection = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var chipsChildren = _chips
        .map<Widget>(
          (data) => widget.chipBuilder(context, this, data),
        )
        .toList();

    final theme = Theme.of(context);

    chipsChildren.add(
      Container(
        height: 32.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              text,
              style: theme.textTheme.subhead.copyWith(
                height: 1.5,
              ),
            ),
            _TextCaret(
              resumed: _focusNode.hasFocus,
            ),
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: requestKeyboard,
          child: InputDecorator(
            decoration: widget.decoration,
            isFocused: _focusNode.hasFocus,
            isEmpty: _value.text.length == 0,
            child: Wrap(
              children: chipsChildren,
              spacing: 4.0,
              runSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void updateEditingValue(TextEditingValue value) {
    final oldCount = _countReplacements(_value);
    final newCount = _countReplacements(value);
    setState(() {
      if (newCount < oldCount) {
        _chips = Set.from(_chips.take(newCount));
      }
      _value = value;
    });
  }

  int _countReplacements(TextEditingValue value) {
    return value.text.codeUnits.where((ch) => ch == kObjectReplacementChar).length;
  }

  @override
  void performAction(TextInputAction action) {
    _focusNode.unfocus();
  }

  void _updateTextInputState() {
    final text = String.fromCharCodes(_chips.map((_) => kObjectReplacementChar));
    _value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange(start: 0, end: text.length),
    );
    _connection.setEditingState(_value);
  }

  @override
  void connectionClosed() {
    // TODO: implement connectionClosed
  }

  @override
  // TODO: implement currentAutofillScope
  AutofillScope get currentAutofillScope => throw UnimplementedError();

  @override
  // TODO: implement currentTextEditingValue
  TextEditingValue get currentTextEditingValue => throw UnimplementedError();

  @override
  void performPrivateCommand(String action, Map<String, dynamic> data) {
      // TODO: implement performPrivateCommand
    }
  
    @override
    void showAutocorrectionPromptRect(int start, int end) {
      // TODO: implement showAutocorrectionPromptRect
    }
  
    @override
    void updateFloatingCursor(RawFloatingCursorPoint point) {
    // TODO: implement updateFloatingCursor
  }
}

class _TextCaret extends StatefulWidget {
  const _TextCaret({
    Key key,
    this.duration = const Duration(milliseconds: 500),
    this.resumed = false,
  }) : super(key: key);

  final Duration duration;
  final bool resumed;

  @override
  _TextCursorState createState() => _TextCursorState();
}

class _TextCursorState extends State<_TextCaret> with SingleTickerProviderStateMixin {
  bool _displayed = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, _onTimer);
  }

  void _onTimer(Timer timer) {
    setState(() => _displayed = !_displayed);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Opacity(
        opacity: _displayed && widget.resumed ? 1.0 : 0.0,
        child: Container(
          width: 2.0,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}