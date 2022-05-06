___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Traffic Type Classifier",
  "categories": ["ANALYTICS", "TAG_MANAGEMENT", "UTILITY"],
  "description": "Classify analytics events based on text in the HTTP User Agent, IP Address, Hostname, URL or any Event Parameter. Use in triggers, or to populate the traffic_type event parameter used in GA4 filters.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "defaultBotGroup",
    "displayName": "Default Bots",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "defaultBotEnable",
        "checkboxText": "Enable Default Bot Classifier",
        "simpleValueType": true,
        "help": "Search the User Agent for a predefined list of bot strings, for example: \u0027Googlebot\u0027. Note: filtering known bots in GA4 is automatic. This is for other tags, like Doubleclick or Facebook."
      },
      {
        "type": "TEXT",
        "name": "defaultBotReturnClassifier",
        "displayName": "Classify all Default Bots as",
        "simpleValueType": true,
        "help": "Classification string returned when a Default Bot is found in the User Agent.",
        "valueValidators": [
          {
            "type": "NON_EMPTY",
            "enablingConditions": [
              {
                "paramName": "defaultBotEnable",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customBotGroup",
    "displayName": "Custom Bots",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "customBotEnable",
        "checkboxText": "Enable Custom Bot Classifier",
        "simpleValueType": true,
        "help": "Search the User Agent for a user defined list of bot strings."
      },
      {
        "type": "PARAM_TABLE",
        "name": "customBotTable",
        "displayName": "Return a classification string when the first condition matches true.",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "customBotName",
              "displayName": "Bot Name",
              "simpleValueType": true,
              "help": "A name to help identify this bot."
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "matchType",
              "displayName": "Match Type",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "equals",
                  "displayValue": "equals"
                },
                {
                  "value": "contains",
                  "displayValue": "contains"
                },
                {
                  "value": "starts with",
                  "displayValue": "starts with"
                },
                {
                  "value": "ends with",
                  "displayValue": "ends with"
                },
                {
                  "value": "regex",
                  "displayValue": "regex"
                },
                {
                  "value": "does not equal",
                  "displayValue": "does not equal"
                },
                {
                  "value": "does not contain",
                  "displayValue": "does not contain"
                },
                {
                  "value": "does not start with",
                  "displayValue": "does not start with"
                },
                {
                  "value": "does not end with",
                  "displayValue": "does not end with"
                },
                {
                  "value": "does not match regex",
                  "displayValue": "does not match regex"
                }
              ],
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ],
              "help": "Note: regex option will recognise regular expressions"
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "searchStr",
              "displayName": "Search String",
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ],
              "help": "Enter string to for all or partial match of the User Agent."
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "caseSensitive",
              "checkboxText": "Case Sensitive",
              "simpleValueType": true,
              "help": "Tick this checkbox to enable case sensitive searching.",
              "defaultValue": false
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "returnClassifier",
              "displayName": "Classify As",
              "simpleValueType": true,
              "help": "Classification string returned when the \u0027Search String\u0027 is matched. Leave blank to use default classifier.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          }
        ]
      }
    ],
    "groupStyle": "ZIPPY_CLOSED"
  },
  {
    "type": "GROUP",
    "name": "ipAddressGroup",
    "displayName": "IP Addresses",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "ipEnable",
        "checkboxText": "Enable IP Address Classifier",
        "simpleValueType": true,
        "help": "Match the client IP address to a user defined list of IP search strings."
      },
      {
        "type": "PARAM_TABLE",
        "name": "ipTable",
        "displayName": "Return a classification string when the first condition matches true.",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "ipName",
              "displayName": "IP Name",
              "simpleValueType": true,
              "help": "A name to help identify this IP address / IP range."
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "matchType",
              "displayName": "Match Type",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "equals",
                  "displayValue": "equals"
                },
                {
                  "value": "contains",
                  "displayValue": "contains"
                },
                {
                  "value": "starts with",
                  "displayValue": "starts with"
                },
                {
                  "value": "ends with",
                  "displayValue": "ends with"
                },
                {
                  "value": "regex",
                  "displayValue": "regex"
                },
                {
                  "value": "does not equal",
                  "displayValue": "does not equal"
                },
                {
                  "value": "does not contain",
                  "displayValue": "does not contain"
                },
                {
                  "value": "does not start with",
                  "displayValue": "does not start with"
                },
                {
                  "value": "does not end with",
                  "displayValue": "does not end with"
                },
                {
                  "value": "does not match regex",
                  "displayValue": "does not match regex"
                }
              ],
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ],
              "help": "Note: regex option will recognise regular expressions."
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "searchStr",
              "displayName": "Search String",
              "simpleValueType": true,
              "help": "Enter string to match the IP address.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "caseSensitive",
              "checkboxText": "Case Sensitive",
              "simpleValueType": true,
              "help": "Tick this checkbox to enable case sensitive searching.",
              "defaultValue": false
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "returnClassifier",
              "displayName": "Classify As",
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                },
                {
                  "type": "NON_EMPTY"
                }
              ],
              "help": "Classification string returned when the \u0027Search String\u0027 is matched."
            },
            "isUnique": false
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "pageLocationGroup",
    "displayName": "Page Locations",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "pageLocationEnable",
        "checkboxText": "Enable Page Location Classifier",
        "simpleValueType": true,
        "help": "Match the Page Location Request URI to a user defined list of search strings."
      },
      {
        "type": "PARAM_TABLE",
        "name": "pageLocationTable",
        "displayName": "Return a classification string when the first condition matches true.",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "pageLocationName",
              "displayName": "Page Location Name",
              "simpleValueType": true,
              "help": "A name to identify this Page Location classifier"
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "matchType",
              "displayName": "Match Type",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "equals",
                  "displayValue": "equals"
                },
                {
                  "value": "contains",
                  "displayValue": "contains"
                },
                {
                  "value": "starts with",
                  "displayValue": "starts with"
                },
                {
                  "value": "ends with",
                  "displayValue": "ends with"
                },
                {
                  "value": "regex",
                  "displayValue": "regex"
                },
                {
                  "value": "does not equal",
                  "displayValue": "does not equal"
                },
                {
                  "value": "does not contain",
                  "displayValue": "does not contain"
                },
                {
                  "value": "does not start with",
                  "displayValue": "does not start with"
                },
                {
                  "value": "does not end with",
                  "displayValue": "does not end with"
                },
                {
                  "value": "does not match regex",
                  "displayValue": "does not match regex"
                }
              ],
              "simpleValueType": true,
              "help": "Note: regex option will recognise regular expressions.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "searchStr",
              "displayName": "Search String",
              "simpleValueType": true,
              "help": "Enter string to for all or partial match of the Page Location URL.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "caseSensitive",
              "checkboxText": "Case Sensitive",
              "simpleValueType": true,
              "help": "Tick this checkbox to enable case sensitive searching.",
              "defaultValue": false
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "returnClassifier",
              "displayName": "Classify As",
              "simpleValueType": true,
              "help": "Classification string returned when the \u0027Search String\u0027 is matched.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventParameterGroup",
    "displayName": "Custom Event Parameters",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "eventParameterEnable",
        "checkboxText": "Enable Event Parameter Classifier",
        "simpleValueType": true,
        "help": "Choose your own event parameter and search for a particular value."
      },
      {
        "type": "PARAM_TABLE",
        "name": "eventParameterTable",
        "displayName": "Return a classification string when the first condition matches true.",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "eventParameterName",
              "displayName": "Event Parameter Name",
              "simpleValueType": true,
              "help": "This is an exact match of the Event Parameter, for example: \"user_agent\" or \"ip_override\". Can be custom event parameters you are passing in the Server Side event payload. This field is case sensitive and is typically in lowercase.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "Match Type",
              "displayName": "Match Type",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "equals",
                  "displayValue": "equals"
                },
                {
                  "value": "contains",
                  "displayValue": "contains"
                },
                {
                  "value": "starts with",
                  "displayValue": "starts with"
                },
                {
                  "value": "ends with",
                  "displayValue": "ends with"
                },
                {
                  "value": "regex",
                  "displayValue": "regex"
                },
                {
                  "value": "does not equal",
                  "displayValue": "does not equal"
                },
                {
                  "value": "does not contain",
                  "displayValue": "does not contain"
                },
                {
                  "value": "does not start with",
                  "displayValue": "does not start with"
                },
                {
                  "value": "does not end with",
                  "displayValue": "does not end with"
                },
                {
                  "value": "does not match regex",
                  "displayValue": "does not match regex"
                }
              ],
              "simpleValueType": true,
              "help": "Note: regex option will recognise regular expressions.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "searchStr",
              "displayName": "Search String",
              "simpleValueType": true,
              "help": "Enter string to for all or partial match of an event parameter.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "caseSensitive",
              "checkboxText": "Case Sensitive",
              "simpleValueType": true,
              "help": "Tick this checkbox to enable case sensitive searching.",
              "defaultValue": false
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "returnClassifier",
              "displayName": "Classify As",
              "simpleValueType": true,
              "help": "Classification string returned when the \u0027Search String\u0027 is matched.",
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": false
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "noMatchStrGroup",
    "displayName": "No Match String",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "noMatchStr",
        "displayName": "Return this string when nothing is classified",
        "simpleValueType": true,
        "help": "This string is returned when none of the above classifications match for the event. Useful to match a return value in triggers.",
        "valueValidators": [
          {
            "type": "NON_EMPTY",
            "enablingConditions": []
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

// Google APIs
const getAllEventData = require('getAllEventData');
const getType = require('getType');

// Get event data object from GA4 Server Side Client
const event = getAllEventData();

/**
 * Gets the comparison string from the user agent or event parameter.
 * @param {object} row The row object of the selected table.
 * @param {object} event Server side event object.
 * @return {boolean} The Event Parameter value, in upper or lower case.
 */
const getCompareStrCased = (row, event) => {
  if (getType(row) !== 'object') return false;
  let compareStr;
  switch (true) {
    case !!row.defaultBotName:
    case !!row.customBotName:
      compareStr = event.user_agent;
      break;
    case !!row.ipName:
      compareStr = event.ip_override;
      break;
    case !!row.pageLocationName:
      compareStr = event.page_location;
      break;
    case !!row.eventParameterName:
      compareStr = event[row.eventParameterName];
      break;
    default:
      return false;
  }
  if (!compareStr) return false;
  return row.caseSensitive ? compareStr : compareStr.toLowerCase();
};

/**
 * Handler to classify based on different match type searches.
 * @param {string} matchType Match Type.
 * @param {string} searchStr Search string.
 * @param {string} compareStr Comparison string.
 * @return {boolean} Returns if row should be classified.
 */
const classifyByMatchType = (matchType, searchStr, compareStr) => {
  if (!searchStr || !compareStr) return false;
  switch (true) {
    case matchType === 'equals':
      return searchStr === compareStr;
    case matchType === 'contains':
      return compareStr.indexOf(searchStr) > -1;
    case matchType === 'starts with':
      return compareStr.indexOf(searchStr) === 0;
    case matchType === 'ends with':
      return compareStr.search(searchStr + '$') === compareStr.length - searchStr.length;
    case matchType === 'regex':
      return compareStr.search(searchStr) > -1;
    case matchType === 'does not equal':
      return searchStr !== compareStr;
    case matchType === 'does not contain':
      return compareStr.indexOf(searchStr) === -1;
    case matchType === 'does not start with':
      return compareStr.indexOf(searchStr) !== 0;
    case matchType === 'does not end with':
      return compareStr.search(searchStr + '$') !== compareStr.length - searchStr.length;
    case matchType === 'does not match regex':
      return compareStr.search(searchStr) === -1;
    default:
      return false;
  }
};

/**
 * Handler to return default classifier for default bots
 * @param {object} row The row object of the selected table.
 * @return {boolean} Default classifier string.
 */
const getDefaultReturnClassifier = (row) => {
  if (!row.defaultBotName) return false;
  return data.defaultBotReturnClassifier;
};

/**
 * Handler for all input tables. Case insensitive searches are managed by placing
 * search and comparison strings into lowercase.
 * @param {array} tableArr Table array.
 * @param {object} event Server side event object.
 * @return {string} Returns the classifier string, if found.
 */
const handleTableClassification = (tableArr, event) => {
  if (getType(tableArr) !== 'array' || getType(event) !== 'object') return false;
  for (let i = 0; i < tableArr.length; i++) {
    const row = tableArr[i];
    if (!row.searchStr) continue;
    const compareStrCased = getCompareStrCased(row, event);
    if (!compareStrCased) continue;
    const searchStrCased = row.caseSensitive ? row.searchStr : row.searchStr.toLowerCase();
    const shouldClassify = classifyByMatchType(row.matchType, searchStrCased, compareStrCased);
    if (shouldClassify) return row.returnClassifier || getDefaultReturnClassifier(row);
  }
};

/** Default Bot Classifier */
if (data.defaultBotEnable) {
  const defaultBotUserAgents = [
    // List taken from Mbaersch's Simple Bot Detector (https://github.com/mbaersch/simple-bot-detector)
    // user-agents for known rendering crawlers from search engines and other services   
    'Googlebot', 
    'AdsBot-Google',
    'Mediapartners-Google',
    'Google Search Console',
    'Chrome-Lighthouse',
    'DuckDuckBot',
    'JobboerseBot',
    'woobot',
    'PingdomPageSpeed',
    'PagePeeker',
    'Refindbot',
    'HubSpot',
    'Yandex',
    'Investment Crawler',
    'BingPreview',
    'Bingbot',
    'Baiduspider',
    'Sogou',
    'SISTRIX',
    'facebookexternalhit',
    'Site-Shot',
    'wkhtmltoimage',
    'SMTBot', 
    'PetalBot', 
    'AhrefsBot', 
    'avalex',
    'RyteBot', 
    'SemrushBot',
    'Cookiebot', 
    'Seekport Crawler',
    'Cocolyzebot', 
    'Veoozbot', 
    'YisouSpider',
    'Elisabot',
    'ev-crawler',
    'screeenly-bot', 
    // poorly configured headless tools
    'HeadlessChrome',
    'MSIE 5.0',
    'PhantomJS'
  ];

  const defaultBotTable = defaultBotUserAgents.map((searchStr) => ({
    defaultBotName: 'Default Bot',
    searchStr: searchStr,
    caseSensitive: false,
    matchType: 'contains',
  }));

  const defaultBotResult = handleTableClassification(defaultBotTable, event);
  if (defaultBotResult) return defaultBotResult;
}

/** Custom Classifiers */
const classifyTypes = ['customBot', 'ip', 'pageLocation', 'eventParameter'];
for (let j = 0; j < classifyTypes.length; j++) {
  const classifyType = classifyTypes[j];
  if (data[classifyType + 'Enable']) {
    const customResult = handleTableClassification(data[classifyType + 'Table'], event);
    if (customResult) return customResult;
  }
}

// If nothing is classified, then pass noMatchStr.
return data.noMatchStr;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 06/05/2022, 11:01:31


