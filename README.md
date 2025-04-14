# TU-XinInput
A simple script for moving things with a transfer unit until X are left in the input container

To install make sure in-connections of the PGM-Board are the following
  1. input container where the items should be pulled out of
  2. the transfer unit

Copy the json file contents and paste it into the PGM-Board

The parameters are:
- amount: the amount to keep
- itemID: a list of Item-IDs which to transfer -- NOTE! Please do NOT remove the curly brackets <br /> `{262147665, 299255727, 3724036288, 4234772167}` --> RIGHT |  `262147665, 299255727, 3724036288, 4234772167` --> WRONG
- new: timeOffset: the offset in which the container is updated in seconds (please consider turning this up to 1 or more if you have more than one PGM-Board that are checking for the content of containers)

If it is not working, please message me via ingame: MrJosh <br />
I'll repair the code as fast as possible but please do not expect fast service, I do not get anything of this and yes, i have other things to do ;)

VR: Josh's Wonderland
