
    Zillow data:    Sales price?
    Zillow data:   How much does it cost to purchase?
    Developer:     Buyer's own estimate on what they think they'll purchase the house for?

    HUD:            What is the FMV?
    HUD:            What is the FMV +/- 10% range
    Zillow:        What is the going rental rate for the area?
    (compare above)

    Zillow:        Finance mortgage calculator
    Developer:      What additional expenses are anticipated to bring property to "livable condition"

    Unknowns:        Additional susidies
    Unknowns:       IRS tax benefits

    Result is the location viable for Low-Incoming Housing investment

   _________________


Objectives
-Create estimate tool for properties
    -zillow has data on what is available for rent while HUD has potential HUD units
    -A goal is to integrate local(Zillow) and HUD data to show potential units
-Map potential HUD Properties using Zillow Sales and Rent Data - What does it cost for the property
-Compare that to Fair Market Value provided by HUD API -
-LIHTC - Calculate Tax Benefit to Home Owner




-SOCRATA MAN: Compare high median rental price vs. cheap homes that can be provided as HUD properties


Federal The Programs
___________________
-Voucher Program
  *Uses Private Proterties
  *Can be used by any Land Lord
  *Sedtion 8
-Privately Owned and Subsidized
  *Section 8
  *Multi-Family Properties
-Public Housing
  *Section 8

State and Local Programs
_________________


Personas
_________________
-Private Developer
  *Develops Property
  *Accepts Voucher
-Public Housing
  *Accepts Voucher

API's
___________________
-HUD Data
    -GeoService -JSON - zillowhack.hud.opendata.arcgis.com
    -Multi-Family Properties - Private
        -STD_City - narrows down to city
        -is_sub and is_sec8_ind="Y" are SQL where filters
        -Proximity filters
        -Lists private
    -Public Housing Authorities
    -FMR - fair market rates
    -LIHTC - Low income tax credits
    -Housing Choice Vouchers - asked to address bc does not include potential qualifying properties

    -HUD Resource Locater
        -Shows affordable housing resources in map
            -Public Housing Authority in Yellow
                -Seattle housing authority, King County Housing Authority
                    -Housing choice voucher
        -Many other programs not a part of HUD and not tracked - IMPORTANT
        -How do we intersect local data with HUD's resource locater
        -Put all resources on a map so that people know what is available to them

    -Housing Affordability - localaffordability.info - DOH & DOT
        -All of the data is located in HUD site
            -Location affordability index data
                -Renters and Owners Data
                    -Transportation Costs and Consumption Data
                    -Demographic Data

-Socrata
  -Gov Data - Zillow Data - communities.socrate.com/catalogs/hack/housing
  -Generates API data - req. application token
      -ex: Median housing price for Seattle housing


Questions
___________________
-What is our scope
    -Who are we targeting?
        -A goal is to integrate local(Zillow) and HUD data to show potential units - IMPORTANT


        For landlords seeking eligible tenants or PHAs seeking to recruit landlords to participate in the voucher program
 How can I connect with potential tenants in my area?
 How can I advertise available units?
 How can PHAs identify areas or landlords to recruit for their voucher programs?
 What new rules and laws do I need to be aware of to make sure my community is in compliance with all federal and local requirements?
 What can I do to make my community more attractive to potential tenants?



    ____________________








