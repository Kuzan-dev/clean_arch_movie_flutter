import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget{
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>{
  final _textCont = TextEditingController();

  @override
  void dispose(){
    _textCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Form(
      child: TextFormField(
        controller: _textCont,
        cursorColor: Colors.white,
        cursorWidth: 1.0,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white.withOpacity(0.65),
        ),
        onChanged: (title) {},
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        prefixIcon: const Icon(
          FluentIcons.search_16_filled,
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _textCont.text = '';
          },
          child: const Icon(
            Icons.clear_rounded,
            color: Colors.red,
          ),
        ),
        hintText: 'Search for Movies, Series...',
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      ),      
    );
  }
}