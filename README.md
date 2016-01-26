#Tipsy

Tipsy is a tip calculator and payment application for iOS.

8 User Stories implemented

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.
* [X] UI animations
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
- [X] Included a slider for added flexibility while calculating tips
- [X] Included the ability to split tips between 4 (or less) people
- [X] Integrated Stripe's API to include additional functionality of paying the business or splitting the bill between friends from within the application 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/asaHhjT.gif' title='Video Walkthrough of Tipsy_Home' width='' alt='Video Walkthrough of Tipsy_Home' />
<img src='http://i.imgur.com/508B4dx.gif' title='Video Walkthrough of Tipsy_Pay' width='' alt='Video Walkthrough of Tipsy_Pay' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

Here's a screenshot of Stripe's Dashboard to show that payments actually went through:

<img src='http://i.imgur.com/ovpMcDF.png' title='Stripe Screenshot' width='' alt='Stripe Screenshot' />

## Notes

No prior iOS programming experience. Intergarting Stripe's API was the hardest part as I had to make request from the app to a server to process the payments. Not a lot of resources available online for Swift 2.0. However, it was a fun and challenging experience overall. Definitely learned a lot! 

## License

    Copyright [2015] [Himank Yadav]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
