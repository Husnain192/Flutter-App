import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
    // Character(
    //     id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
    // Character(
    //     id: '2',
    //     name: 'Jonny',
    //     vocation: Vocation.junkie,
    //     slogan: 'Light me up...'),
    // Character(
    //     id: '3',
    //     name: 'Crimson',
    //     vocation: Vocation.raider,
    //     slogan: 'Fire in the hole!'),
    // Character(
    //     id: '4',
    //     name: 'Shaun',
    //     vocation: Vocation.ninja,
    //     slogan: 'Alright then gang.'),
  final List<Character> _characters = [];

  get characters => _characters;

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }
}
