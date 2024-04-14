// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final String role;
  final String avatar;

  TeamMember({
    required this.name,
    required this.role,
    required this.avatar,
  });
}

class TeamPage extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
        name: 'Augusto Junior',
        role: 'Desenvolvedor Backend',
        avatar: 'assets/collaborators/augusto.png'),
    TeamMember(name: 'Débora Marcião', role: 'Designer', avatar: ''),
    TeamMember(
        name: 'Marcos Printes',
        role: 'Desenvolvedor Mobile',
        avatar: 'assets/collaborators/marcos.png'),
    TeamMember(
        name: 'Rui Harayama',
        role: 'Colaborador',
        avatar: 'assets/collaborators/rui.png'),
  ];

  TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: teamMembers.length,
      itemBuilder: (context, index) {
        return buildTeamMemberCard(teamMembers[index]);
      },
    );
  }

  static const titleStyle = TextStyle(fontWeight: FontWeight.bold);

  Widget buildTeamMemberCard(TeamMember member) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
          leading: member.avatar.isEmpty
              ? const Icon(Icons.account_circle, size: 66)
              : CircleAvatar(
                  radius: 30.0, backgroundImage: AssetImage(member.avatar)),
          title: Text(member.name, style: titleStyle),
          subtitle: Text(member.role)),
    );
  }
}
