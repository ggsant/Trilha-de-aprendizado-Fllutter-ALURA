import 'package:flutter/material.dart';
import 'package:flutter_bank/components/icones.dart';
import 'package:flutter_bank/screens/home/settings/lenguages.dart';
import 'package:settings_ui/settings_ui.dart';

class PageFourMenu extends StatefulWidget {
  @override
  _PageFourMenuState createState() => _PageFourMenuState();
}

class _PageFourMenuState extends State<PageFourMenu> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: 'Lingua',
                subtitle: 'Português',
                leading: CustomIcons(
                  icon: Icons.language,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Conta',
            titleTextStyle: TextStyle(
              color: Color.fromRGBO(83, 109, 254, 1),
              fontWeight: FontWeight.bold,
            ),
            tiles: [
              SettingsTile(
                title: 'Telefone',
                leading: CustomIcons(
                  icon: Icons.phone,
                ),
              ),
              SettingsTile(
                title: 'Email',
                leading: CustomIcons(
                  icon: Icons.email,
                ),
              ),
              SettingsTile(
                title: 'Sair',
                leading: CustomIcons(
                  icon: Icons.exit_to_app,
                ),
              ),
            ],
          ),
          SettingsSection(
            title: 'Segurança',
            titleTextStyle: TextStyle(
              color: Color.fromRGBO(83, 109, 254, 1),
              fontWeight: FontWeight.bold,
            ),
            tiles: [
              SettingsTile.switchTile(
                title: 'Bloquear aplicativo em segundo plano',
                leading: CustomIcons(
                  icon: Icons.phonelink_lock,
                ),
                switchValue: lockInBackground,
                switchActiveColor: Color.fromRGBO(83, 109, 254, 1),
                enabled: true,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Use digital',
                leading: CustomIcons(
                  icon: Icons.fingerprint,
                ),
                onToggle: (bool value) {},
                switchValue: false,
                switchActiveColor: Color.fromRGBO(83, 109, 254, 1),
                enabled: true,
              ),
              SettingsTile.switchTile(
                title: 'Alterar senha',
                leading: CustomIcons(
                  icon: Icons.lock,
                ),
                switchValue: true,
                switchActiveColor: Color.fromRGBO(83, 109, 254, 1),
                enabled: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Ativar notificações',
                enabled: notificationsEnabled,
                leading: CustomIcons(
                  icon: Icons.notifications_active,
                ),
                switchValue: true,
                switchActiveColor: Color.fromRGBO(83, 109, 254, 1),
                onToggle: (value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Outros',
            titleTextStyle: TextStyle(
              color: Color.fromRGBO(83, 109, 254, 1),
              fontWeight: FontWeight.bold,
            ),
            tiles: [
              SettingsTile(
                title: 'Termos de uso',
                leading: CustomIcons(
                  icon: Icons.description,
                ),
              ),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
                SizedBox(height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
