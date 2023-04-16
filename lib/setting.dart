import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SettingPage());

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _showLogo = true;
  bool _showDate = true;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _showLogo = _prefs!.getBool('showLogo') ?? true;
      _showDate = _prefs!.getBool('showDate') ?? true;
    });
  }

  void _updatePreferences(String key, bool value) async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs!.setBool(key, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Text("Display(表示)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          SwitchListTile(
            title: Text('Show logo'),
            value: _showLogo,
            onChanged: (value) {
              setState(() {
                _showLogo = value;
                _updatePreferences('showLogo', value);
              });
            },
          ),
          SwitchListTile(
            title: Text('Show date'),
            value: _showDate,
            onChanged: (value) {
              setState(() {
                _showDate = value;
                _updatePreferences('showDate', value);
              });
            },
          ),
          Text("Other(その他)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          Text('''usagi_AR 2023-
          developer: gochi_AI
          thanks LIst
           *koi
           *cafe lumiere
           *less-ar.com
           *gitpod
           *flutter
           *ARCore
           *Figma
           And 
           . u''',textAlign: TextAlign.left),
          Text("Link",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

        ],
      ),
    );
  }
}
