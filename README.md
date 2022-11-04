Stock Market Report
=======================

Screenshots
============
![Alt text](/assets/images/screenshots/1.png?raw=true "Home")
![Alt text](/assets/images/screenshots/2.png?raw=true "Stock Details")
![Alt text](/assets/images/screenshots/3.png?raw=true "Filter")
![Alt text](/assets/images/screenshots/4.png?raw=true "Search")

Using the marketstack.com API, this is a flutter app that shows the stock market report of 10 random
companies. Also includes a date range and an auto complete search box to the UI. The autocomplete feature
filters the list returned from the API. Also, notifies the user if the device is offline.

Requirements
============

* Flutter SDK >= >=2.19.0-255.2.beta <3.0.0
* Dart

Installation
============

Just clone the project, run pub get and it is ready to use!

Service Provider

Facade

Usage
=====

Get country of the visitor

    GeoIP::getCountry();  // returns "United States"

Get country code of the visitor

    GeoIP::getCountryCode();  // returns "US"

Get region of the visitor


Credits
=======

* marketstack.com web api
* MaxMind for the data
