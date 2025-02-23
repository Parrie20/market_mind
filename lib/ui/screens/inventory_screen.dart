import 'package:flutter/material.dart';
import '../widgets/real_time_inventory_widget.dart';
import '../widgets/circular_progress_indicator.dart';
import '../widgets/sales_trends_chart.dart'; // Import the chart widget

class InventoryScreen extends StatelessWidget {
  Color _getCardColor(int percentage) {
    // Calculate the color dynamically using a gradient from red to green
    return Color.lerp(Colors.red, Colors.green, percentage / 100)!;
  }

  @override
  Widget build(BuildContext context) {
    int percentage = 98 ; // Example percentage value

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  color: _getCardColor(percentage),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Warehouse',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CircularProgressIndicatorWithLabel(
                        percentage: percentage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Inventory Tips',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tip: Keep your stock updated weekly to avoid low-stock situations and meet customer demands effectively.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Sales Trends',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4,
                child: Container(
                  height: 200,
                  child: SalesTrendsChart(), // Use the chart widget here
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Product Statistics',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Product:',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Text('Tirupati Sunflower cooking oil - 500 Units Sold',
                          style: TextStyle(fontSize: 14)),
                      SizedBox(height: 10),
                      Text(
                        'Low Stock Alert:',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Text('lux soap - Only 20 Units Left',
                          style: TextStyle(fontSize: 14)),
                      SizedBox(height: 10),
                      Text(
                        'Best Month:',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                        'December - ₹2,50,000 Revenue',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
