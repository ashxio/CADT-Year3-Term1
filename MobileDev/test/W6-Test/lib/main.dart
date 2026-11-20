
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: 
        // YOUR CODE
        Column(
          children: [
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(color: Colors.purple),
                  ),
                  Container(
                    width: 70, 
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70, 
                    color: Colors.yellow,
                  ),
                  Container(width: 20, color: Colors.purple),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // LIGHT BLUE (2/5)
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.lightBlue,
                    ),
                  ),

                  SizedBox(width: 12),

                  // PINK (3/5)
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.pink,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(height: 40, color: Colors.brown,
            ),
          ],
        ),
      ),
    ),
  );
}
