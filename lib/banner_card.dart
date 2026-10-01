import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E3DC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'P 58',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: .bold,
                  letterSpacing: -1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      'About P58',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.add, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'P58 Marketplace\nONLY TOP BRANDS',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                    fontWeight: .w600,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Trekking and outdoor clothing F/W COLLECTION',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: .bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
