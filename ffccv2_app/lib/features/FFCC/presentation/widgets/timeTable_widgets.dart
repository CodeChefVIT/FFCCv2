import 'package:ffccv2_app/constants/colors.dart';
import 'package:flutter/material.dart';

class LabHeader extends StatelessWidget {
  const LabHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SquareCard(
          label: 'Lab',
          color: KColor.ttlightPurple,
        ),
        TwoHorizontalH40CardColumn(
          color: Colors.white,
          label1: 'Start',
          label2: 'End',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '08:00',
          label2: '08:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '08:46',
          label2: '09:30',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '10:00',
          label2: '10:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '10:46',
          label2: '11:30',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '11:31',
          label2: '12:15',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '12:16',
          label2: '13:00',
        ),
        //mid
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: 'Lunch',
          label2: 'Lunch',
        ),
        //mid
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '14:00',
          label2: '14:45',
        ),

        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '14:46',
          label2: '15:30',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '16:00',
          label2: '16:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '16:46',
          label2: '17:30',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '17:31',
          label2: '18:15',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '18:16',
          label2: '19:00',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttlightPurple,
          label1: '-',
          label2: '-',
        ),
      ],
    );
  }
}

class TheoryHeader extends StatelessWidget {
  const TheoryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SquareCard(
          label: 'Theory',
          color: KColor.ttPurple,
        ),
        TwoHorizontalH40CardColumn(
          color: Colors.white,
          label1: 'Start',
          label2: 'End',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '08:00',
          label2: '08:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '09:00',
          label2: '09:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '10:00',
          label2: '10:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '11:00',
          label2: '11:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '12:00',
          label2: '12:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '-',
          label2: '-',
        ),

        //mid
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: 'Lunch',
          label2: 'Lunch',
        ),
        //mid
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '14:00',
          label2: '14:45',
        ),

        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '15:00',
          label2: '15:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '16:00',
          label2: '16:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '17:00',
          label2: '17:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '18:00',
          label2: '18:45',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '18:46',
          label2: '19:00',
        ),
        TwoHorizontalH40CardColumn(
          color: KColor.ttPurple,
          label1: '19:01',
          label2: '19:45',
        ),
      ],
    );
  }
}

class WeekDayTT extends StatelessWidget {
  const WeekDayTT({
    Key? key,
    this.day,
  }) : super(key: key);
  final String? day;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VerticalCard(
          label: day,
        ),
        TwoSquareCardColumn(
          isFirstColumn: true,
        ),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        //mid
        SizedBox(
          width: 80,
        ),
        //mid
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
        TwoSquareCardColumn(),
      ],
    );
  }
}

class VerticalCard extends StatelessWidget {
  const VerticalCard({
    Key? key,
    this.label,
  }) : super(key: key);
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 160,
      child: Card(
        color: KColor.ttBlue,
        child: Center(
            child: Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}

class TwoSquareCardColumn extends StatelessWidget {
  const TwoSquareCardColumn({
    Key? key,
    this.label1 = '',
    this.label2 = '',
    this.isFirstColumn = false,
  }) : super(key: key);
  final String label1, label2;
  final bool isFirstColumn;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SquareCard(
          color: isFirstColumn ? KColor.ttBlue : Colors.white,
          label: isFirstColumn ? 'Theory' : label1,
        ),
        SquareCard(
          color: isFirstColumn ? KColor.ttBlue : Colors.white,
          label: isFirstColumn ? 'Lab' : label2,
        ),
      ],
    );
  }
}

class TwoHorizontalH40CardColumn extends StatelessWidget {
  const TwoHorizontalH40CardColumn({
    Key? key,
    this.label1 = '',
    this.label2 = '',
    this.color,
  }) : super(key: key);
  final String label1, label2;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalCard(
          label: label1,
          color: color,
        ),
        HorizontalCard(
          label: label2,
          color: color,
        ),
      ],
    );
  }
}

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key? key,
    this.label,
    this.color,
  }) : super(key: key);
  final String? label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      child: Card(
        color: color,
        child: Center(
            child: Text(
          label!,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class SquareCard extends StatelessWidget {
  const SquareCard({
    Key? key,
    this.label,
    this.color,
  }) : super(key: key);
  final String? label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Card(
        color: color,
        child: Center(
            child: Text(
          label!,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
