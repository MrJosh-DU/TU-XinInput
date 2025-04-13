# TU-XinInput
A simple script for moving things with a transfer unit until X are left in the input container

To install make sure in-connections of the PGM-Board are the following
  1. input container where the items should be pulled out of
  2. the transfer unit

Copy the json file contents and paste it into the PGM-Board

The parameters are:
- amount: the amount to keep
- itemID: a list of Item-IDs which to transfer -- NOTE! Please do NOT remove the curly brackets <br /> `{262147665, 299255727, 3724036288, 4234772167}` --> RIGHT |  `262147665, 299255727, 3724036288, 4234772167` --> WRONG
