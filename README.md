
# Traffic Type Classifier


## What is the Traffic Type Classifier?
The Traffic Type Classifier is a custom template variable for GTM server-side which labels (or classifies) each of your events with a string to identify where your traffic is coming from. This label is determined by searching for a particular value in your event parameters.

Multiple classification rules can be setup, and are run in order of priority. If a match is found, a classification string is returned and no further rules are considered. If no match is found, a default string is returned. The Traffic Type Classifier can be used to populate the `traffic_type` event parameter used in GA4 filtering, or as a filter condition in GTM server-side triggers.

The Traffic Type Classifier has 5 different types:

1.  **Default Bots** - Search the `user_agent` for a preset list of known bots (inspired by  [Simple Bot Detector](https://github.com/mbaersch/simple-bot-detector)).
2.  **Custom Bots** - Search the `user_agent` for a custom list of bots.
3.  **IP Addresses** - Search the IP Address (`ip_override`) for certain IP Addresses.
4.  **Page Locations** - Search the Request URI (`page_location`) for certain URLs or partial matches of URLs.
5.  **Custom Event Parameters** - Search any event parameter in the event payload.


## Traffic Type Classifier benefits
In GA4 Properties, you can only currently filter traffic based on IP address, and not by other fields in the HTTP request header or other event parameters. The Traffic Type Classifier allows this, and has an interface reminiscent of Universal Analytics filters. This has the following benefits:

 - Filter traffic into different GA4 properties based off more than just IP address.
 - Consistently apply the same filter standards across all your server-side Martech tags, not just GA.
 - Use a dedicated GTM variable for `OR` logic filtering, which can be more suitable and cleaner than filtering traffic with standard GTM Trigger `AND` logic.


## Using the Traffic Type Classifier
Log into GTM server-side, and select **Templates** > **Variable Templates** > **Search Gallery**

![Row Image](images/template.png)

After adding the **Traffic Type Classifier** from Google's [Community Template Gallery](https://tagmanager.google.com/gallery/#/variables?context=server&page=1), navigate to your server-side **Variables** and click **New** under User-Defined Variables. Then choose **Custom Templates** > **Traffic Type Classifier**.

### Enabling a Classifier
Ticking the "Enable Classifier" checkbox will enable all classification rules for that type. Unchecking means these rules will be skipped.

### Adding a new Classification
The below example shows how to add a new classification for the *Custom Bot* classifier, but the interface is the same for all other classifiers, except for *Default Bots*, where you just need to enter a default classification string.

Start by clicking **Add Row**:


![Add Row Image](images/addRow.png)


 1. Now, enter a **Name** for the classification. For *Custom Bots*, *IP Addresses* and *Page Locations*, this is just a friendly name used to identify the classification, while for *Custom Event Parameters*, this must be the exact parameter name, typically in `snake_case` for example: `page_title`.
 2. Choose a **Match Type** from the drop-down menu. You'll see all the regular options here including negative matches.
 3. Enter a **Search** string. Note, regex options must be in a regular expression format.
 4. Choose whether the search string is **Case Sensitive** or not. Default is not case sensitive.
 5. Choose a **Classify As** classification string. This is the string returned by the variable if a match was found.
 6. One done hit **Add**.
   
 
![Add Row Modal Image](images/addRowModal.png)

You should now see the following row added to the table:

![Table Image](images/table.png)

Don't forget to add a **No match String**. This is the classification string returned when there are no matches to any classification rules.

![No match Image](images/noMatch.png)

## Using The Classification Variable
Once you've created your server-side variable, you can now use it in a number of ways. The two most common use cases are to populate the GA4 [`traffic_type`](https://support.google.com/analytics/answer/10108813?hl=en) parameter, and to use it as condition in a server-side trigger.


### Use Case 1: GA4 Traffic Type Parameter
Use the Traffic Type Classifier to populate the `traffic_type` parameter, and send it to GA4.

![Tag Parameters Image](images/tagParam.png)

This can then be used as a filter condition in GA4. To do this, log into GA4, click **Admin** > **Data Settings** > **Data Filters** > **Create Filter**. Using the Acme Bots example, you could configure the GA4 filter as follows:

![GA4 Filters Image](images/ga4.png)


### Use Case 2: Trigger Condition
This example shows how the same Traffic Type Classifier can also be used as a filter condition for your GTM server-side triggers. For example, only allow **external** traffic into the GA4 production account (**external** is the string returned when there's been no classification matches).

![Trigger Condition Image](images/trigger.png)
