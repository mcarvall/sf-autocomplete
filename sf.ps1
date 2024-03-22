
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

$scriptblock = {
  param($WordToComplete, $CommandAst, $CursorPosition)

  $Commands =
  @{
    "alias"           = @{
      "_summary" = "Use the alias commands to manage your aliases."
      "list"     = @{
        "_command" = @{
          "summary" = "List all aliases currently set on your local computer."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

      "set"      = @{
        "_command" = @{
          "summary" = "Set one or more aliases on your local computer."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

      "unset"    = @{
        "_command" = @{
          "summary" = "Unset one or more aliases that are currently set on your local computer."
          "flags"   = @{
            "help"      = @{ "summary" = "Show help for command" }
            "json"      = @{ "summary" = "Format output as json." }
            "all"       = @{ "summary" = "Unset all currently set aliases." }
            "no-prompt" = @{ "summary" = "Don't prompt the user for confirmation when unsetting all aliases." }
          }
        }
      }

    }

    "analytics"       = @{
      "_summary" = "Work with analytics assets."
      "generate" = @{
        "_summary" = "Create analytics templates."
        "template" = @{
          "_command" = @{
            "summary" = "Generate a simple Analytics template."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "name"        = @{ "summary" = "Name of the Analytics template." }
            }
          }
        }

      }

    }

    "apex"            = @{
      "_summary" = "Use the apex commands to create Apex classes, execute anonymous blocks, view your logs, run Apex tests, and view Apex test results."
      "generate" = @{
        "_summary" = "Create an apex class or trigger."
        "class"    = @{
          "_command" = @{
            "summary" = "Generate an Apex class."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Apex class." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "trigger"  = @{
          "_command" = @{
            "summary" = "Generate an Apex trigger."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Apex trigger" }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "sobject"     = @{ "summary" = "Salesforce object to generate a trigger on." }
              "event"       = @{
                "summary"  = "Events that fire the trigger."
                "multiple" = $true
              }
            }
          }
        }

      }

      "get"      = @{
        "_summary" = "Get debug logs or test results."
        "log"      = @{
          "_command" = @{
            "summary" = "Fetch the specified log or given number of most recent logs from the org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "log-id"      = @{ "summary" = "ID of the specific log to display." }
              "number"      = @{ "summary" = "Number of the most recent logs to display." }
              "output-dir"  = @{ "summary" = "Directory for saving the log files." }
            }
          }
        }

        "test"     = @{
          "_command" = @{
            "summary" = "Display test results for a specific asynchronous test run."
            "flags"   = @{
              "help"          = @{ "summary" = "Show help for command" }
              "json"          = @{ "summary" = "Format output as json." }
              "target-org"    = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"   = @{ "summary" = "Override the api version used for api requests made by this command" }
              "test-run-id"   = @{ "summary" = "ID of the test run." }
              "code-coverage" = @{ "summary" = "Retrieve code coverage results." }
              "output-dir"    = @{ "summary" = "Directory in which to store test result files." }
              "result-format" = @{ "summary" = "Format of the results." }
            }
          }
        }

      }

      "list"     = @{
        "_summary" = "List debug logs."
        "log"      = @{
          "_command" = @{
            "summary" = "Display a list of IDs and general information about debug logs."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "run"      = @{
        "_command" = @{
          "summary" = "Execute anonymous Apex code entered on the command line or from a local file."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "file"        = @{ "summary" = "Path to a local file that contains Apex code." }
          }
        }
        "test"     = @{
          "_command" = @{
            "summary" = "Invoke Apex tests in an org."
            "flags"   = @{
              "help"              = @{ "summary" = "Show help for command" }
              "json"              = @{ "summary" = "Format output as json." }
              "target-org"        = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"       = @{ "summary" = "Override the api version used for api requests made by this command" }
              "code-coverage"     = @{ "summary" = "Retrieve code coverage results." }
              "output-dir"        = @{ "summary" = "Directory in which to store test run files." }
              "test-level"        = @{ "summary" = "Level of tests to run; default is RunLocalTests." }
              "class-names"       = @{
                "summary"  = "Apex test class names to run; default is all classes."
                "multiple" = $true
              }
              "result-format"     = @{ "summary" = "Format of the test results." }
              "suite-names"       = @{
                "summary"  = "Apex test suite names to run."
                "multiple" = $true
              }
              "tests"             = @{
                "summary"  = "Apex test class names or IDs and, if applicable, test methods to run; default is all tests."
                "multiple" = $true
              }
              "wait"              = @{ "summary" = "Sets the streaming client socket timeout in minutes; specify a longer wait time if timeouts occur frequently." }
              "synchronous"       = @{ "summary" = "Runs test methods from a single Apex class synchronously; if not specified, tests are run asynchronously." }
              "detailed-coverage" = @{ "summary" = "Display detailed code coverage per test." }
            }
          }
        }
      }

      "tail"     = @{
        "_summary" = "Tail debug logs."
        "log"      = @{
          "_command" = @{
            "summary" = "Activate debug logging and display logs in the terminal."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "color"           = @{ "summary" = "Apply default colors to noteworthy log lines." }
              "debug-level"     = @{ "summary" = "Debug level to set on the DEVELOPER_LOG trace flag for your user." }
              "skip-trace-flag" = @{ "summary" = "Skip trace flag setup. Assumes that a trace flag and debug level are fully set up." }
            }
          }
        }

      }

    }

    "cmdt"            = @{
      "_summary" = "Generate a field for a custom metadata type based on the provided field type."
      "generate" = @{
        "_summary" = "Generate a field for a custom metadata type based on the provided field type."
        "field"    = @{
          "_command" = @{
            "summary" = "Generate a field for a custom metadata type based on the provided field type."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "name"             = @{ "summary" = "Unique name for the field." }
              "type"             = @{ "summary" = "Type of the field." }
              "picklist-values"  = @{
                "summary"  = "Picklist values; required for picklist fields."
                "multiple" = $true
              }
              "decimal-places"   = @{ "summary" = "Number of decimal places to use for number or percent fields." }
              "label"            = @{ "summary" = "Label for the field." }
              "output-directory" = @{ "summary" = "Directory to store newly-created field definition files." }
            }
          }
        }

        "fromorg"  = @{
          "_command" = @{
            "summary" = "Generate a custom metadata type and all its records from a Salesforce object."
            "flags"   = @{
              "help"                  = @{ "summary" = "Show help for command" }
              "json"                  = @{ "summary" = "Format output as json." }
              "target-org"            = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
              "dev-name"              = @{ "summary" = "Name of the custom metadata type." }
              "label"                 = @{ "summary" = "Label for the custom metadata type." }
              "plural-label"          = @{ "summary" = "Plural version of the label value; if blank, uses label." }
              "visibility"            = @{ "summary" = "Who can see the custom metadata type." }
              "sobject"               = @{ "summary" = "API name of the source Salesforce object used to generate the custom metadata type." }
              "ignore-unsupported"    = @{ "summary" = "Ignore unsupported field types." }
              "type-output-directory" = @{ "summary" = "Directory to store newly-created custom metadata type files." }
              "records-output-dir"    = @{ "summary" = "Directory to store newly-created custom metadata record files." }
            }
          }
        }

        "object"   = @{
          "_command" = @{
            "summary" = "Generate a new custom metadata type in the current project."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "type-name"        = @{ "summary" = "Unique object name for the custom metadata type." }
              "label"            = @{ "summary" = "Label for the custom metadata type." }
              "plural-label"     = @{ "summary" = "Plural version of the label value; if blank, uses label." }
              "visibility"       = @{ "summary" = "Who can see the custom metadata type." }
              "output-directory" = @{ "summary" = "Directory to store the newly-created custom metadata type files" }
            }
          }
        }

        "record"   = @{
          "_command" = @{
            "summary" = "Generate a new record for a given custom metadata type in the current project."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for; must end in ""__mdt""." }
              "record-name"      = @{ "summary" = "Name of the new record." }
              "label"            = @{ "summary" = "Label for the new record." }
              "protected"        = @{ "summary" = "Protect the record when it's in a managed package." }
              "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
              "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
            }
          }
        }

        "records"  = @{
          "_command" = @{
            "summary" = "Generate new custom metadata type records from a CSV file."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "csv"              = @{ "summary" = "Pathname of the CSV file." }
              "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for." }
              "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
              "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
              "name-column"      = @{ "summary" = "Column used to determine the name of the record." }
            }
          }
        }

      }

      "field"    = @{
        "_summary" = "cmdt field commands"
        "create"   = @{
          "_command" = @{
            "summary" = "Generate a field for a custom metadata type based on the provided field type."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "name"             = @{ "summary" = "Unique name for the field." }
              "type"             = @{ "summary" = "Type of the field." }
              "picklist-values"  = @{
                "summary"  = "Picklist values; required for picklist fields."
                "multiple" = $true
              }
              "decimal-places"   = @{ "summary" = "Number of decimal places to use for number or percent fields." }
              "label"            = @{ "summary" = "Label for the field." }
              "output-directory" = @{ "summary" = "Directory to store newly-created field definition files." }
            }
          }
        }

      }

      "record"   = @{
        "_summary" = "cmdt record commands"
        "create"   = @{
          "_command" = @{
            "summary" = "Generate a new record for a given custom metadata type in the current project."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for; must end in ""__mdt""." }
              "record-name"      = @{ "summary" = "Name of the new record." }
              "label"            = @{ "summary" = "Label for the new record." }
              "protected"        = @{ "summary" = "Protect the record when it's in a managed package." }
              "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
              "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
            }
          }
        }

        "insert"   = @{
          "_command" = @{
            "summary" = "Generate new custom metadata type records from a CSV file."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "csv"              = @{ "summary" = "Pathname of the CSV file." }
              "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for." }
              "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
              "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
              "name-column"      = @{ "summary" = "Column used to determine the name of the record." }
            }
          }
        }

      }

      "create"   = @{
        "_command" = @{
          "summary" = "Generate a new custom metadata type in the current project."
          "flags"   = @{
            "help"             = @{ "summary" = "Show help for command" }
            "json"             = @{ "summary" = "Format output as json." }
            "type-name"        = @{ "summary" = "Unique object name for the custom metadata type." }
            "label"            = @{ "summary" = "Label for the custom metadata type." }
            "plural-label"     = @{ "summary" = "Plural version of the label value; if blank, uses label." }
            "visibility"       = @{ "summary" = "Who can see the custom metadata type." }
            "output-directory" = @{ "summary" = "Directory to store the newly-created custom metadata type files" }
          }
        }
      }

    }

    "community"       = @{
      "_summary" = "Create an Experience Cloud site using a template."
      "list"     = @{
        "_summary" = "Retrieve the list of templates available in your org."
        "template" = @{
          "_command" = @{
            "summary" = "Retrieve the list of templates available in your org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "create"   = @{
        "_command" = @{
          "summary" = "Create an Experience Cloud site using a template."
          "flags"   = @{
            "help"            = @{ "summary" = "Show help for command" }
            "json"            = @{ "summary" = "Format output as json." }
            "name"            = @{ "summary" = "Name of the site to create." }
            "template-name"   = @{ "summary" = "Template to use to create a site." }
            "url-path-prefix" = @{ "summary" = "URL to append to the domain created when Digital Experiences was enabled for this org." }
            "description"     = @{ "summary" = "Description of the site." }
            "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
          }
        }
      }

      "publish"  = @{
        "_command" = @{
          "summary" = "Publish an Experience Builder site to make it live."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "name"        = @{ "summary" = "Name of the Experience Builder site to publish." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
          }
        }
      }

    }

    "config"          = @{
      "_summary" = "Commands to configure Salesforce CLI."
      "get"      = @{
        "_command" = @{
          "summary" = "Get the value of a configuration variable."
          "flags"   = @{
            "help"    = @{ "summary" = "Show help for command" }
            "json"    = @{ "summary" = "Format output as json." }
            "verbose" = @{ "summary" = "Display whether the configuration variables are set locally or globally." }
          }
        }
      }

      "list"     = @{
        "_command" = @{
          "summary" = "List the configuration variables that you've previously set."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

      "set"      = @{
        "_command" = @{
          "summary" = "Set one or more configuration variables, such as your default org."
          "flags"   = @{
            "help"   = @{ "summary" = "Show help for command" }
            "json"   = @{ "summary" = "Format output as json." }
            "global" = @{ "summary" = "Set the configuration variables globally, so they can be used from any Salesforce DX project." }
          }
        }
      }

      "unset"    = @{
        "_command" = @{
          "summary" = "Unset local or global configuration variables."
          "flags"   = @{
            "help"   = @{ "summary" = "Show help for command" }
            "json"   = @{ "summary" = "Format output as json." }
            "global" = @{ "summary" = "Unset the configuration variables globally." }
          }
        }
      }

    }

    "data"            = @{
      "_summary" = "Manage records in your org."
      "create"   = @{
        "_summary" = "Create a record."
        "record"   = @{
          "_command" = @{
            "summary" = "Create and insert a record into a Salesforce or Tooling API object."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're inserting a record into." }
              "values"          = @{ "summary" = "Values for the flags in the form <fieldName>=<value>, separate multiple pairs with spaces." }
              "use-tooling-api" = @{ "summary" = "Use Tooling API so you can insert a record in a Tooling API object." }
            }
          }
        }

      }

      "delete"   = @{
        "_summary" = "Delete a single record or multiple records in bulk."
        "bulk"     = @{
          "_command" = @{
            "summary" = "Bulk delete records from an org using a CSV file. Uses Bulk API 2.0."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "file"        = @{ "summary" = "CSV file that contains the IDs of the records to update or delete." }
              "sobject"     = @{ "summary" = "API name of the Salesforce object, either standard or custom, that you want to update or delete records from." }
              "wait"        = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
              "async"       = @{ "summary" = "Run the command asynchronously." }
              "verbose"     = @{ "summary" = "Print verbose output of failed records if result is available." }
            }
          }
        }

        "record"   = @{
          "_command" = @{
            "summary" = "Deletes a single record from a Salesforce or Tooling API object."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're deleting a record from." }
              "record-id"       = @{ "summary" = "ID of the record you’re deleting." }
              "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to delete." }
              "use-tooling-api" = @{ "summary" = "Use Tooling API so you can delete a record from a Tooling API object." }
            }
          }
        }

        "resume"   = @{
          "_command" = @{
            "summary" = "Resume a bulk delete job that you previously started. Uses Bulk API 2.0."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Org alias or username to use for the target org." }
              "job-id"          = @{ "summary" = "ID of the job you want to resume." }
              "use-most-recent" = @{ "summary" = "Use the ID of the most recently-run bulk job." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "export"   = @{
        "_summary" = "Export data from your org."
        "beta"     = @{
          "_summary" = "Export data from an org into one or more JSON files."
          "tree"     = @{
            "_command" = @{
              "summary" = "Export data from an org into one or more JSON files."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "query"       = @{ "summary" = "SOQL query, or filepath of a file that contains the query, to retrieve records." }
                "plan"        = @{ "summary" = "Generate multiple sObject tree files and a plan definition file for aggregated import." }
                "prefix"      = @{ "summary" = "Prefix of generated files." }
                "output-dir"  = @{ "summary" = "Directory in which to generate the JSON files; default is current directory." }
              }
            }
          }

        }

        "tree"     = @{
          "_command" = @{
            "summary" = "Export data from an org into one or more JSON files."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "query"       = @{ "summary" = "SOQL query, or filepath of a file that contains the query, to retrieve records." }
              "plan"        = @{ "summary" = "Generate multiple sObject tree files and a plan definition file for aggregated import." }
              "prefix"      = @{ "summary" = "Prefix of generated files." }
              "output-dir"  = @{ "summary" = "Directory in which to generate the JSON files; default is current directory." }
            }
          }
        }

      }

      "get"      = @{
        "_summary" = "Get a single record."
        "record"   = @{
          "_command" = @{
            "summary" = "Retrieve and display a single record of a Salesforce or Tooling API object."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're retrieving a record from." }
              "record-id"       = @{ "summary" = "ID of the record you’re retrieving." }
              "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to display." }
              "use-tooling-api" = @{ "summary" = "Use Tooling API so you can retrieve a record from a Tooling API object." }
            }
          }
        }

      }

      "import"   = @{
        "_summary" = "Import data to your org."
        "beta"     = @{
          "_summary" = "Import data from one or more JSON files into an org."
          "tree"     = @{
            "_command" = @{
              "summary" = "Import data from one or more JSON files into an org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "files"       = @{
                  "summary"  = "Comma-separated and in-order JSON files that contain the records, in sObject tree format, that you want to insert."
                  "multiple" = $true
                }
                "plan"        = @{ "summary" = "Plan definition file to insert multiple data files." }
              }
            }
          }

        }

        "tree"     = @{
          "_command" = @{
            "summary" = "Import data from one or more JSON files into an org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "files"       = @{
                "summary"  = "Comma-separated and in-order JSON files that contain the records, in sObject tree format, that you want to insert."
                "multiple" = $true
              }
              "plan"        = @{ "summary" = "Plan definition file to insert multiple data files." }
            }
          }
        }

      }

      "query"    = @{
        "_command" = @{
          "summary" = "Execute a SOQL query."
          "flags"   = @{
            "help"            = @{ "summary" = "Show help for command" }
            "json"            = @{ "summary" = "Format output as json." }
            "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
            "query"           = @{ "summary" = "SOQL query to execute." }
            "file"            = @{ "summary" = "File that contains the SOQL query." }
            "use-tooling-api" = @{ "summary" = "Use Tooling API so you can run queries on Tooling API objects." }
            "bulk"            = @{ "summary" = "Use Bulk API 2.0 to run the query." }
            "wait"            = @{ "summary" = "Time to wait for the command to finish, in minutes." }
            "async"           = @{ "summary" = "Use Bulk API 2.0, but don't wait for the job to complete." }
            "all-rows"        = @{ "summary" = "Include deleted records. By default, deleted records are not returned." }
            "result-format"   = @{ "summary" = "Format to display the results; the --json flag overrides this flag." }
          }
        }
        "resume"   = @{
          "_command" = @{
            "summary" = "View the status of a bulk query."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Org alias or username to use for the target org." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "result-format"   = @{ "summary" = "Format to display the results; the --json flag overrides this flag." }
              "bulk-query-id"   = @{ "summary" = "Job ID of the bulk query." }
              "use-most-recent" = @{ "summary" = "Use the most recent bulk query ID from cache." }
            }
          }
        }
      }

      "update"   = @{
        "_summary" = "Update a single record."
        "record"   = @{
          "_command" = @{
            "summary" = "Updates a single record of a Salesforce or Tooling API object."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that contains the record you're updating." }
              "record-id"       = @{ "summary" = "ID of the record you’re updating." }
              "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to update." }
              "values"          = @{ "summary" = "Fields that you're updating, in the format of <fieldName>=<value> pairs." }
              "use-tooling-api" = @{ "summary" = "Use Tooling API so you can update a record in a Tooling API object." }
            }
          }
        }

      }

      "upsert"   = @{
        "_summary" = "Upsert many records."
        "bulk"     = @{
          "_command" = @{
            "summary" = "Bulk upsert records to an org from a CSV file. Uses Bulk API 2.0."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "file"        = @{ "summary" = "CSV file that contains the IDs of the records to update or delete." }
              "sobject"     = @{ "summary" = "API name of the Salesforce object, either standard or custom, that you want to update or delete records from." }
              "wait"        = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
              "async"       = @{ "summary" = "Run the command asynchronously." }
              "verbose"     = @{ "summary" = "Print verbose output of failed records if result is available." }
              "external-id" = @{ "summary" = "Name of the external ID field, or the Id field." }
            }
          }
        }

        "resume"   = @{
          "_command" = @{
            "summary" = "Resume a bulk upsert job that you previously started. Uses Bulk API 2.0."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "target-org"      = @{ "summary" = "Org alias or username to use for the target org." }
              "job-id"          = @{ "summary" = "ID of the job you want to resume." }
              "use-most-recent" = @{ "summary" = "Use the ID of the most recently-run bulk job." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "resume"   = @{
        "_command" = @{
          "summary" = "View the status of a bulk data load job or batch."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "batch-id"    = @{ "summary" = "ID of the batch whose status you want to view; you must also specify the job ID." }
            "job-id"      = @{ "summary" = "ID of the job whose status you want to view." }
          }
        }
      }

    }

    "deploy"          = @{
      "_summary"  = "Deploy a Salesforce Function to an org from your local project."
      "metadata"  = @{
        "cancel"   = @{
          "_command" = @{
            "summary" = "Cancel a deploy operation."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "async"           = @{ "summary" = "Run the command asynchronously." }
              "job-id"          = @{ "summary" = "Job ID of the deploy operation you want to cancel." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
            }
          }
        }
        "preview"  = @{
          "_command" = @{
            "summary" = "Preview a deployment to see what will deploy to the org, the potential conflicts, and the ignored files."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "ignore-conflicts" = @{ "summary" = "Don't display conflicts in preview of the deployment." }
              "manifest"         = @{ "summary" = "Full file path for manifest (package.xml) of components to preview." }
              "metadata"         = @{
                "summary"  = "Metadata component names to preview."
                "multiple" = $true
              }
              "source-dir"       = @{
                "summary"  = "Path to the local source files to preview."
                "multiple" = $true
              }
              "target-org"       = @{ "summary" = "Login username or alias for the target org." }
              "concise"          = @{ "summary" = "Show only the changes that will be deployed; omits files that are forceignored." }
            }
          }
        }
        "quick"    = @{
          "_command" = @{
            "summary" = "Quickly deploy a validated deployment to an org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "async"           = @{ "summary" = "Run the command asynchronously." }
              "concise"         = @{ "summary" = "Show concise output of the deploy result." }
              "job-id"          = @{ "summary" = "Job ID of the deployment you want to quick deploy." }
              "target-org"      = @{ "summary" = "Login username or alias for the target org." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recently validated deployment." }
              "verbose"         = @{ "summary" = "Show verbose output of the deploy result." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "api-version"     = @{ "summary" = "Target API version for the deploy." }
            }
          }
        }
        "report"   = @{
          "_command" = @{
            "summary" = "Check or poll for the status of a deploy operation."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "target-org"          = @{ "summary" = "Login username or alias for the target org." }
              "job-id"              = @{ "summary" = "Job ID of the deploy operation you want to check the status of." }
              "use-most-recent"     = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "coverage-formatters" = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"               = @{ "summary" = "Output JUnit test results." }
              "results-dir"         = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
              "wait"                = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
            }
          }
        }
        "resume"   = @{
          "_command" = @{
            "summary" = "Resume watching a deploy operation and update source tracking when the deploy completes."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "concise"             = @{ "summary" = "Show concise output of the deploy operation result." }
              "job-id"              = @{ "summary" = "Job ID of the deploy operation you want to resume." }
              "use-most-recent"     = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "verbose"             = @{ "summary" = "Show verbose output of the deploy operation result." }
              "wait"                = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "coverage-formatters" = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"               = @{ "summary" = "Output JUnit test results." }
              "results-dir"         = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
            }
          }
        }
        "_command" = @{
          "summary" = "Deploy metadata to an org from your local project."
          "flags"   = @{
            "help"                     = @{ "summary" = "Show help for command" }
            "json"                     = @{ "summary" = "Format output as json." }
            "api-version"              = @{ "summary" = "Target API version for the deploy." }
            "async"                    = @{ "summary" = "Run the command asynchronously." }
            "concise"                  = @{ "summary" = "Show concise output of the deploy result." }
            "dry-run"                  = @{ "summary" = "Validate deploy and run Apex tests but don’t save to the org." }
            "ignore-conflicts"         = @{ "summary" = "Ignore conflicts and deploy local files, even if they overwrite changes in the org." }
            "ignore-errors"            = @{ "summary" = "Ignore any errors and don’t roll back deployment." }
            "ignore-warnings"          = @{ "summary" = "Ignore warnings and allow a deployment to complete successfully." }
            "manifest"                 = @{ "summary" = "Full file path for manifest (package.xml) of components to deploy." }
            "metadata"                 = @{
              "summary"  = "Metadata component names to deploy. Wildcards (``*`` ) supported as long as you use quotes, such as ``ApexClass:MyClass*``."
              "multiple" = $true
            }
            "metadata-dir"             = @{ "summary" = "Root of directory or zip file of metadata formatted files to deploy." }
            "single-package"           = @{ "summary" = "Indicates that the metadata zip file points to a directory structure for a single package." }
            "source-dir"               = @{
              "summary"  = "Path to the local source files to deploy."
              "multiple" = $true
            }
            "target-org"               = @{ "summary" = "Login username or alias for the target org." }
            "tests"                    = @{
              "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
              "multiple" = $true
            }
            "test-level"               = @{ "summary" = "Deployment Apex testing level." }
            "verbose"                  = @{ "summary" = "Show verbose output of the deploy result." }
            "wait"                     = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
            "purge-on-delete"          = @{ "summary" = "Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin." }
            "pre-destructive-changes"  = @{ "summary" = "File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy." }
            "post-destructive-changes" = @{ "summary" = "File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy." }
            "coverage-formatters"      = @{
              "summary"  = "Format of the code coverage results."
              "multiple" = $true
            }
            "junit"                    = @{ "summary" = "Output JUnit test results." }
            "results-dir"              = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
          }
        }
        "validate" = @{
          "_command" = @{
            "summary" = "Validate a metadata deployment without actually executing it."
            "flags"   = @{
              "help"                     = @{ "summary" = "Show help for command" }
              "json"                     = @{ "summary" = "Format output as json." }
              "api-version"              = @{ "summary" = "Target API version for the validation." }
              "async"                    = @{ "summary" = "Run the command asynchronously." }
              "concise"                  = @{ "summary" = "Show concise output of the validation result." }
              "manifest"                 = @{ "summary" = "Full file path for manifest (package.xml) of components to validate for deployment." }
              "metadata"                 = @{
                "summary"  = "Metadata component names to validate for deployment."
                "multiple" = $true
              }
              "source-dir"               = @{
                "summary"  = "Path to the local source files to validate for deployment."
                "multiple" = $true
              }
              "metadata-dir"             = @{ "summary" = "Root of directory or zip file of metadata formatted files to deploy." }
              "single-package"           = @{ "summary" = "Indicates that the metadata zip file points to a directory structure for a single package." }
              "target-org"               = @{ "summary" = "Login username or alias for the target org." }
              "tests"                    = @{
                "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                "multiple" = $true
              }
              "test-level"               = @{ "summary" = "Deployment Apex testing level." }
              "verbose"                  = @{ "summary" = "Show verbose output of the validation result." }
              "wait"                     = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "ignore-warnings"          = @{ "summary" = "Ignore warnings and allow a deployment to complete successfully." }
              "coverage-formatters"      = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"                    = @{ "summary" = "Output JUnit test results." }
              "results-dir"              = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
              "purge-on-delete"          = @{ "summary" = "Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin." }
              "pre-destructive-changes"  = @{ "summary" = "File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy" }
              "post-destructive-changes" = @{ "summary" = "File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy." }
            }
          }
        }
      }

      "functions" = @{
        "_command" = @{
          "summary" = "Deploy a Salesforce Function to an org from your local project."
          "flags"   = @{
            "help"          = @{ "summary" = "Show help for command" }
            "json"          = @{ "summary" = "Format output as json." }
            "connected-org" = @{ "summary" = "Username or alias for the org that the compute environment should be connected to." }
            "branch"        = @{ "summary" = "Deploy the latest commit from a branch different from the currently active branch." }
            "force"         = @{ "summary" = "Ignore warnings and overwrite remote repository (not allowed in production)." }
            "quiet"         = @{ "summary" = "Limit the amount of output displayed from the deploy process." }
          }
        }
      }

    }

    "dev"             = @{
      "_summary" = "Audit messages in a plugin's messages directory to locate unused messages and missing messages that have references in source code."
      "audit"    = @{
        "_summary" = "Audit messages in a plugin's messages directory to locate unused messages and missing messages that have references in source code."
        "messages" = @{
          "_command" = @{
            "summary" = "Audit messages in a plugin's messages directory to locate unused messages and missing messages that have references in source code."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "project-dir"  = @{ "summary" = "Location of the project where messages are to be audited." }
              "messages-dir" = @{ "summary" = "Directory that contains the plugin's message files." }
              "source-dir"   = @{ "summary" = "Directory that contains the plugin's source code." }
            }
          }
        }

      }

      "convert"  = @{
        "_summary" = "Convert a .json messages file into Markdown."
        "messages" = @{
          "_command" = @{
            "summary" = "Convert a .json messages file into Markdown."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "project-dir" = @{ "summary" = "Location of the project whose messages are to be converted." }
              "file-name"   = @{
                "summary"  = "Filename to convert."
                "multiple" = $true
              }
            }
          }
        }

        "script"   = @{
          "_command" = @{
            "summary" = "Convert a script file that contains deprecated sfdx-style commands to use the new sf-style commands instead."
            "flags"   = @{
              "help"   = @{ "summary" = "Show help for command" }
              "json"   = @{ "summary" = "Format output as json." }
              "script" = @{ "summary" = "Filepath to the script you want to convert." }
            }
          }
        }

      }

      "generate" = @{
        "_summary" = "Generate a new sf command."
        "command"  = @{
          "_command" = @{
            "summary" = "Generate a new sf command."
            "flags"   = @{
              "help"  = @{ "summary" = "Show help for command" }
              "name"  = @{ "summary" = "Name of the new command. Use colons to separate the topic and command names." }
              "force" = @{ "summary" = "Overwrite existing files." }
              "nuts"  = @{ "summary" = "Generate a NUT test file for the command." }
              "unit"  = @{ "summary" = "Generate a unit test file for the command." }
            }
          }
        }

        "flag"     = @{
          "_command" = @{
            "summary" = "Generate a flag for an existing command."
            "flags"   = @{
              "help"    = @{ "summary" = "Show help for command" }
              "dry-run" = @{ "summary" = "Print new flag code instead of adding it to the command file." }
            }
          }
        }

        "library"  = @{
          "_command" = @{
            "summary" = "Generate a new library."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
            }
          }
        }

        "plugin"   = @{
          "_command" = @{
            "summary" = "Generate a new sf plugin."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
            }
          }
        }

      }

    }

    "env"             = @{
      "_summary" = "Add a Heroku user as a collaborator on this Functions account, allowing them to attach Heroku add-ons to compute environments."
      "compute"  = @{
        "_summary"     = "Add a Heroku user as a collaborator on this Functions account, allowing them to attach Heroku add-ons to compute environments."
        "collaborator" = @{
          "_summary" = "Add a Heroku user as a collaborator on this Functions account, allowing them to attach Heroku add-ons to compute environments."
          "add"      = @{
            "_command" = @{
              "summary" = "Add a Heroku user as a collaborator on this Functions account, allowing them to attach Heroku add-ons to compute environments."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "heroku-user" = @{ "summary" = "Email address of the Heroku user you're adding as a collaborator." }
              }
            }
          }

        }

      }

      "create"   = @{
        "_summary" = "Create a compute environment for use with Salesforce Functions."
        "compute"  = @{
          "_command" = @{
            "summary" = "Create a compute environment for use with Salesforce Functions."
            "flags"   = @{
              "help"          = @{ "summary" = "Show help for command" }
              "json"          = @{ "summary" = "Format output as json." }
              "connected-org" = @{ "summary" = "Username or alias for the org that the compute environment should be connected to." }
              "alias"         = @{ "summary" = "Alias for the created environment." }
            }
          }
        }

        "sandbox"  = @{
          "_command" = @{
            "summary" = "Create a sandbox org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "definition-file" = @{ "summary" = "Path to a sandbox definition file." }
              "set-default"     = @{ "summary" = "Set the sandbox org as your default org." }
              "alias"           = @{ "summary" = "Alias for the sandbox org." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the sandbox org to be ready." }
              "poll-interval"   = @{ "summary" = "Number of seconds to wait between retries." }
              "async"           = @{ "summary" = "Request the sandbox creation, but don't wait for it to complete." }
              "name"            = @{ "summary" = "Name of the sandbox org." }
              "clone"           = @{ "summary" = "Name of the sandbox org to clone." }
              "license-type"    = @{ "summary" = "Type of sandbox license." }
              "target-org"      = @{ "summary" = "Username or alias of the production org that contains the sandbox license." }
              "no-prompt"       = @{ "summary" = "Don't prompt for confirmation about the sandbox configuration." }
              "no-track-source" = @{ "summary" = "Do not use source tracking for this sandbox." }
            }
          }
        }

        "scratch"  = @{
          "_command" = @{
            "summary" = "Create a scratch org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "alias"           = @{ "summary" = "Alias for the scratch org." }
              "async"           = @{ "summary" = "Request the org, but don't wait for it to complete." }
              "set-default"     = @{ "summary" = "Set the scratch org as your default org" }
              "definition-file" = @{ "summary" = "Path to a scratch org definition file." }
              "target-dev-hub"  = @{ "summary" = "Username or alias of the Dev Hub org." }
              "no-ancestors"    = @{ "summary" = "Don't include second-generation managed package (2GP) ancestors in the scratch org." }
              "edition"         = @{ "summary" = "Salesforce edition of the scratch org. Overrides the value of the ""edition"" option in the definition file, if set." }
              "no-namespace"    = @{ "summary" = "Create the scratch org with no namespace, even if the Dev Hub has a namespace." }
              "duration-days"   = @{ "summary" = "Number of days before the org expires." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the scratch org to be ready." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "client-id"       = @{ "summary" = "Consumer key of the Dev Hub connected app." }
              "track-source"    = @{ "summary" = "Use source tracking for this scratch org. Set --no-track-source to disable source tracking." }
              "username"        = @{ "summary" = "Username of the scratch org admin user. Overrides the value of the ""username"" option in the definition file, if set." }
              "description"     = @{ "summary" = "Description of the scratch org in the Dev Hub. Overrides the value of the ""description"" option in the definition file, if set." }
              "name"            = @{ "summary" = "Name of the org, such as ""Acme Company"". Overrides the value of the ""orgName"" option in the definition file, if set." }
              "release"         = @{ "summary" = "Release of the scratch org as compared to the Dev Hub release." }
              "admin-email"     = @{ "summary" = "Email address that will be applied to the org's admin user. Overrides the value of the ""adminEmail"" option in the definition file, if set." }
              "source-org"      = @{ "summary" = "15-character ID of the org whose shape the new scratch org will be based on. Overrides the value of the ""sourceOrg"" option in the definition file, if set." }
            }
          }
        }

      }

      "log"      = @{
        "_command" = @{
          "summary" = "Stream log output for an environment."
          "flags"   = @{
            "help"           = @{ "summary" = "Show help for command" }
            "target-compute" = @{ "summary" = "Compute environment name to retrieve logs." }
            "num"            = @{ "summary" = "Number of lines to display." }
          }
        }
        "tail"     = @{
          "_command" = @{
            "summary" = "Stream log output for an environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "target-compute" = @{ "summary" = "Compute environment name to retrieve logs." }
            }
          }
        }
      }

      "logdrain" = @{
        "_summary" = "Add log drain to a specified environment."
        "add"      = @{
          "_command" = @{
            "summary" = "Add log drain to a specified environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
              "drain-url"      = @{ "summary" = "Endpoint that will receive sent logs." }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List log drains connected to a specified environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
            }
          }
        }

        "remove"   = @{
          "_command" = @{
            "summary" = "Remove log drain from a specified environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
              "drain-url"      = @{ "summary" = "Log drain url to remove." }
            }
          }
        }

      }

      "var"      = @{
        "_summary" = "Display a single config variable for an environment."
        "get"      = @{
          "_command" = @{
            "summary" = "Display a single config variable for an environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List your environment's config vars in a table."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
            }
          }
        }

        "set"      = @{
          "_command" = @{
            "summary" = "Set a single config value for an environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
            }
          }
        }

        "unset"    = @{
          "_command" = @{
            "summary" = "Unset a single config value for an environment."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-compute" = @{ "summary" = "Environment name." }
            }
          }
        }

      }

      "delete"   = @{
        "_command" = @{
          "summary" = "Delete an environment."
          "flags"   = @{
            "help"           = @{ "summary" = "Show help for command" }
            "json"           = @{ "summary" = "Format output as json." }
            "target-compute" = @{ "summary" = "Environment name." }
            "confirm"        = @{
              "summary"  = "Confirmation name."
              "multiple" = $true
            }
          }
        }
        "sandbox"  = @{
          "_command" = @{
            "summary" = "Delete a sandbox."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Sandbox alias or login user." }
              "no-prompt"  = @{ "summary" = "Don't prompt the user to confirm the deletion." }
            }
          }
        }
        "scratch"  = @{
          "_command" = @{
            "summary" = "Delete a scratch org."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Scratch org alias or login user." }
              "no-prompt"  = @{ "summary" = "Don't prompt the user to confirm the deletion." }
            }
          }
        }
      }

      "resume"   = @{
        "_summary" = "env resume commands"
        "sandbox"  = @{
          "_command" = @{
            "summary" = "Check the status of a sandbox creation, and log in to it if it's ready."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the sandbox org to be ready." }
              "name"            = @{ "summary" = "Name of the sandbox org." }
              "job-id"          = @{ "summary" = "Job ID of the incomplete sandbox creation that you want to check the status of." }
              "use-most-recent" = @{ "summary" = "Use the most recent sandbox create request." }
              "target-org"      = @{ "summary" = "Username or alias of the production org that contains the sandbox license." }
            }
          }
        }

        "scratch"  = @{
          "_command" = @{
            "summary" = "Resume the creation of an incomplete scratch org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "job-id"          = @{ "summary" = "Job ID of the incomplete scratch org create that you want to resume." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recent incomplete scratch org." }
            }
          }
        }

      }

      "display"  = @{
        "_command" = @{
          "summary" = "Display details about an environment."
          "flags"   = @{
            "help"       = @{ "summary" = "Show help for command" }
            "json"       = @{ "summary" = "Format output as json." }
            "target-env" = @{ "summary" = "Environment alias or login user." }
          }
        }
      }

      "list"     = @{
        "_command" = @{
          "summary" = "List the environments you’ve created or logged into."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "all"         = @{ "summary" = "Show all environments, even inactive ones." }
            "columns"     = @{
              "summary"  = "List of columns to display."
              "multiple" = $true
            }
            "csv"         = @{ "summary" = "Output in csv format [alias: --output=csv]" }
            "filter"      = @{ "summary" = "Filter property by partial string matching." }
            "no-header"   = @{ "summary" = "Hide table header from output." }
            "no-truncate" = @{ "summary" = "Don't truncate output to fit screen." }
            "output"      = @{ "summary" = "Format in which to display the output." }
            "sort"        = @{ "summary" = "Column to sort by (prepend '-' for descending)." }
          }
        }
      }

      "open"     = @{
        "_command" = @{
          "summary" = "Open an environment in a web browser."
          "flags"   = @{
            "help"       = @{ "summary" = "Show help for command" }
            "json"       = @{ "summary" = "Format output as json." }
            "path"       = @{ "summary" = "Path to append to the end of the login URL." }
            "url-only"   = @{ "summary" = "Display the URL, but don’t launch it in a browser." }
            "target-env" = @{ "summary" = "Login user or alias of the environment to open." }
            "browser"    = @{ "summary" = "Browser in which to open the environment." }
          }
        }
      }

    }

    "force"           = @{
      "_summary"       = "Legacy commands for backward compatibility."
      "data"           = @{
        "_summary" = "Manage records in your org using Bulk API V1."
        "bulk"     = @{
          "_summary" = "Bulk manage records in your org using Bulk API V1"
          "delete"   = @{
            "_command" = @{
              "summary" = "Bulk delete records from an org using a CSV file. Uses Bulk API 1.0."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "file"        = @{ "summary" = "CSV file that contains the IDs of the records to delete." }
                "sobject"     = @{ "summary" = "API name of the Salesforce object, either standard or custom, that you want to delete records from." }
                "wait"        = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
              }
            }
          }

          "status"   = @{
            "_command" = @{
              "summary" = "View the status of a bulk data load job or batch. Uses Bulk API 1.0."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "batch-id"    = @{ "summary" = "ID of the batch whose status you want to view; you must also specify the job ID." }
                "job-id"      = @{ "summary" = "ID of the job whose status you want to view." }
              }
            }
          }

          "upsert"   = @{
            "_command" = @{
              "summary" = "Bulk upsert records to an org from a CSV file. Uses Bulk API 1.0."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "external-id" = @{ "summary" = "Name of the external ID field, or the Id field." }
                "file"        = @{ "summary" = "CSV file that contains the records to upsert." }
                "sobject"     = @{ "summary" = "API name of the Salesforce object, either standard or custom, that you want to upsert records to." }
                "wait"        = @{ "summary" = "Number of minutes to wait for the command to complete before displaying the results." }
                "serial"      = @{ "summary" = "Run batches in serial mode." }
              }
            }
          }

        }

        "record"   = @{
          "_summary" = "force data record commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Create and insert a record into a Salesforce or Tooling API object."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're inserting a record into." }
                "values"          = @{ "summary" = "Values for the flags in the form <fieldName>=<value>, separate multiple pairs with spaces." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API so you can insert a record in a Tooling API object." }
              }
            }
          }

          "delete"   = @{
            "_command" = @{
              "summary" = "Deletes a single record from a Salesforce or Tooling API object."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're deleting a record from." }
                "record-id"       = @{ "summary" = "ID of the record you’re deleting." }
                "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to delete." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API so you can delete a record from a Tooling API object." }
              }
            }
          }

          "get"      = @{
            "_command" = @{
              "summary" = "Retrieve and display a single record of a Salesforce or Tooling API object."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that you're retrieving a record from." }
                "record-id"       = @{ "summary" = "ID of the record you’re retrieving." }
                "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to display." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API so you can retrieve a record from a Tooling API object." }
              }
            }
          }

          "update"   = @{
            "_command" = @{
              "summary" = "Updates a single record of a Salesforce or Tooling API object."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"         = @{ "summary" = "API name of the Salesforce or Tooling API object that contains the record you're updating." }
                "record-id"       = @{ "summary" = "ID of the record you’re updating." }
                "where"           = @{ "summary" = "List of <fieldName>=<value> pairs that identify the record you want to update." }
                "values"          = @{ "summary" = "Fields that you're updating, in the format of <fieldName>=<value> pairs." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API so you can update a record in a Tooling API object." }
              }
            }
          }

        }

        "tree"     = @{
          "_summary" = "force data tree commands"
          "export"   = @{
            "_command" = @{
              "summary" = "Export data from an org into one or more JSON files."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "query"       = @{ "summary" = "SOQL query, or filepath of a file that contains the query, to retrieve records." }
                "plan"        = @{ "summary" = "Generate multiple sObject tree files and a plan definition file for aggregated import." }
                "prefix"      = @{ "summary" = "Prefix of generated files." }
                "output-dir"  = @{ "summary" = "Directory in which to generate the JSON files; default is current directory." }
              }
            }
          }

          "import"   = @{
            "_command" = @{
              "summary" = "Import data from one or more JSON files into an org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "files"       = @{
                  "summary"  = "Comma-separated and in-order JSON files that contain the records, in sObject tree format, that you want to insert."
                  "multiple" = $true
                }
                "plan"        = @{ "summary" = "Plan definition file to insert multiple data files." }
              }
            }
          }

        }

        "soql"     = @{
          "_summary" = "force data soql commands"
          "bulk"     = @{
            "_summary" = "force data soql bulk commands"
            "report"   = @{
              "_command" = @{
                "summary" = "View the status of a bulk query."
                "flags"   = @{
                  "help"            = @{ "summary" = "Show help for command" }
                  "json"            = @{ "summary" = "Format output as json." }
                  "target-org"      = @{ "summary" = "Org alias or username to use for the target org." }
                  "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                  "result-format"   = @{ "summary" = "Format to display the results; the --json flag overrides this flag." }
                  "bulk-query-id"   = @{ "summary" = "Job ID of the bulk query." }
                  "use-most-recent" = @{ "summary" = "Use the most recent bulk query ID from cache." }
                }
              }
            }

          }

          "query"    = @{
            "_command" = @{
              "summary" = "Execute a SOQL query."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "query"           = @{ "summary" = "SOQL query to execute." }
                "file"            = @{ "summary" = "File that contains the SOQL query." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API so you can run queries on Tooling API objects." }
                "bulk"            = @{ "summary" = "Use Bulk API 2.0 to run the query." }
                "wait"            = @{ "summary" = "Time to wait for the command to finish, in minutes." }
                "async"           = @{ "summary" = "Use Bulk API 2.0, but don't wait for the job to complete." }
                "all-rows"        = @{ "summary" = "Include deleted records. By default, deleted records are not returned." }
                "result-format"   = @{ "summary" = "Format to display the results; the --json flag overrides this flag." }
              }
            }
          }

        }

      }

      "lightning"      = @{
        "_summary"  = "creates a Lightning web component test file with boilerplate code inside a __tests__ directory."
        "lwc"       = @{
          "_summary" = "creates a Lightning web component test file with boilerplate code inside a __tests__ directory."
          "test"     = @{
            "_summary" = "creates a Lightning web component test file with boilerplate code inside a __tests__ directory."
            "create"   = @{
              "_command" = @{
                "summary" = "creates a Lightning web component test file with boilerplate code inside a __tests__ directory."
                "flags"   = @{
                  "help"     = @{ "summary" = "Show help for command" }
                  "json"     = @{ "summary" = "format output as json" }
                  "loglevel" = @{ "summary" = "logging level for this command invocation" }
                  "filepath" = @{ "summary" = "path to Lightning web component .js file to create a test for" }
                }
              }
            }

            "run"      = @{
              "_command" = @{
                "summary" = "invokes Lightning Web Components Jest unit tests."
                "flags"   = @{
                  "help"     = @{ "summary" = "Show help for command" }
                  "json"     = @{ "summary" = "format output as json" }
                  "loglevel" = @{ "summary" = "logging level for this command invocation" }
                  "debug"    = @{ "summary" = "run tests in debug mode" }
                  "watch"    = @{ "summary" = "run tests in watch mode" }
                }
              }
            }

            "setup"    = @{
              "_command" = @{
                "summary" = "install Jest unit testing tools for Lightning Web Components."
                "flags"   = @{
                  "help"     = @{ "summary" = "Show help for command" }
                  "json"     = @{ "summary" = "format output as json" }
                  "loglevel" = @{ "summary" = "logging level for this command invocation" }
                }
              }
            }

          }

        }

        "app"       = @{
          "_summary" = "force lightning app commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Lightning App."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Lightning App." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "component" = @{
          "_summary" = "force lightning component commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a bundle for an Aura component or a Lightning web component."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Lightning Component." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "type"        = @{ "summary" = "Type of the component bundle." }
              }
            }
          }

        }

        "event"     = @{
          "_summary" = "force lightning event commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Lightning Event."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Lightning Event." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "interface" = @{
          "_summary" = "force lightning interface commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Lightning Interface."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Lightning Interface." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "test"      = @{
          "_summary" = "force lightning test commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Lightning test."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Lightning Test." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

      }

      "mdapi"          = @{
        "_summary"         = "deploy, retrieve and convert Metadata API-formatted metadata using Metadata API"
        "convert"          = @{
          "_command" = @{
            "summary" = "Convert metadata retrieved via Metadata API into the source format used in Salesforce DX projects."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "api-version"  = @{ "summary" = "Override the api version used for api requests made by this command" }
              "root-dir"     = @{ "summary" = "Root directory that contains the Metadata API-formatted metadata." }
              "output-dir"   = @{ "summary" = "Directory to store your files in after they’re converted to source format; can be an absolute or relative path." }
              "manifest"     = @{ "summary" = "File path to manifest (package.xml) of metadata types to convert." }
              "metadata-dir" = @{
                "summary"  = "Root of directory or zip file of metadata formatted files to convert."
                "multiple" = $true
              }
              "metadata"     = @{
                "summary"  = "Metadata component names to convert."
                "multiple" = $true
              }
            }
          }
        }

        "listmetadata"     = @{
          "_command" = @{
            "summary" = "List the metadata components and properties of a specified type."
            "flags"   = @{
              "help"          = @{ "summary" = "Show help for command" }
              "json"          = @{ "summary" = "Format output as json." }
              "api-version"   = @{ "summary" = "API version to use; default is the most recent API version." }
              "target-org"    = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "output-file"   = @{ "summary" = "Pathname of the file in which to write the results." }
              "metadata-type" = @{ "summary" = "Metadata type to be retrieved, such as CustomObject; metadata type names are case-sensitive." }
              "folder"        = @{ "summary" = "Folder associated with the component; required for components that use folders; folder names are case-sensitive." }
            }
          }
        }

        "describemetadata" = @{
          "_command" = @{
            "summary" = "Display details about the metadata types that are enabled for your org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "api-version" = @{ "summary" = "API version to use; default is the most recent API version." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "output-file" = @{ "summary" = "Pathname of the file in which to write the results." }
            }
          }
        }

      }

      "source"         = @{
        "_summary" = "commands to interact with source formatted metadata"
        "tracking" = @{
          "_summary" = "force source tracking commands"
          "clear"    = @{
            "_command" = @{
              "summary" = "Delete all local source tracking information."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "no-prompt"   = @{ "summary" = "Don't prompt for source tracking override confirmation." }
              }
            }
          }

          "reset"    = @{
            "_command" = @{
              "summary" = "Reset local and remote source tracking."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "revision"    = @{ "summary" = "SourceMember revision counter number to reset to." }
                "no-prompt"   = @{ "summary" = "Don't prompt for source tracking override confirmation." }
              }
            }
          }

        }

        "manifest" = @{
          "_summary" = "force source manifest commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Create a project manifest that lists the metadata components you want to deploy or retrieve."
              "flags"   = @{
                "help"             = @{ "summary" = "Show help for command" }
                "json"             = @{ "summary" = "Format output as json." }
                "api-version"      = @{ "summary" = "Override the api version used for api requests made by this command" }
                "metadata"         = @{
                  "summary"  = "Names of metadata components to include in the manifest."
                  "multiple" = $true
                }
                "source-dir"       = @{
                  "summary"  = "Paths to the local source files to include in the manifest."
                  "multiple" = $true
                }
                "name"             = @{ "summary" = "Name of a custom manifest file to create." }
                "type"             = @{ "summary" = "Type of manifest to create; the type determines the name of the created file." }
                "include-packages" = @{
                  "summary"  = "Package types (managed, unlocked) whose metadata is included in the manifest; by default, metadata in packages is ignored."
                  "multiple" = $true
                }
                "from-org"         = @{ "summary" = "Username or alias of the org that contains the metadata components from which to build a manifest." }
                "output-dir"       = @{ "summary" = "Directory to save the created manifest." }
              }
            }
          }

        }

        "ignored"  = @{
          "_summary" = "force source ignored commands"
          "list"     = @{
            "_command" = @{
              "summary" = "Check your local project package directories for forceignored files."
              "flags"   = @{
                "help"       = @{ "summary" = "Show help for command" }
                "json"       = @{ "summary" = "Format output as json." }
                "source-dir" = @{ "summary" = "File or directory of files that the command checks for foreceignored files." }
              }
            }
          }

        }

        "convert"  = @{
          "_command" = @{
            "summary" = "Convert source-formatted files into metadata that you can deploy using Metadata API."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "api-version"  = @{ "summary" = "API Version to use in the generated project's manifest. By default, will use the version from sfdx-project.json" }
              "root-dir"     = @{ "summary" = "Source directory other than the default package to convert." }
              "output-dir"   = @{ "summary" = "Output directory to store the Metadata API-formatted files in." }
              "package-name" = @{ "summary" = "Name of the package to associate with the metadata-formatted files." }
              "manifest"     = @{ "summary" = "Path to the manifest (package.xml) file that specifies the metadata types to convert." }
              "source-dir"   = @{
                "summary"  = "Paths to the local source files to convert."
                "multiple" = $true
              }
              "metadata"     = @{
                "summary"  = "Metadata component names to convert."
                "multiple" = $true
              }
            }
          }
        }

        "delete"   = @{
          "_command" = @{
            "summary" = "Delete source from your project and from a non-source-tracked org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "check-only"      = @{ "summary" = "Validate delete command but don't delete anything from the org or the local project." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to finish." }
              "tests"           = @{
                "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                "multiple" = $true
              }
              "test-level"      = @{ "summary" = "Deployment Apex testing level." }
              "no-prompt"       = @{ "summary" = "Don't prompt for delete confirmation." }
              "metadata"        = @{
                "summary"  = "Metadata components to delete."
                "multiple" = $true
              }
              "source-dir"      = @{
                "summary"  = "Source file paths to delete."
                "multiple" = $true
              }
              "track-source"    = @{ "summary" = "If the delete succeeds, update the source tracking information." }
              "force-overwrite" = @{ "summary" = "Ignore conflict warnings and overwrite changes to the org." }
              "verbose"         = @{ "summary" = "Verbose output of the delete result." }
            }
          }
        }

        "open"     = @{
          "_command" = @{
            "summary" = "Open your default scratch org, or another specified org, in a browser."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "private"     = @{ "summary" = "Open the org in the default browser using private (incognito) mode." }
              "browser"     = @{ "summary" = "Browser where the org opens." }
              "path"        = @{ "summary" = "Navigation URL path to open a specific page." }
              "url-only"    = @{ "summary" = "Display navigation URL, but don’t launch browser." }
              "source-file" = @{ "summary" = "Path to an ApexPage or FlexiPage to open in Lightning App Builder." }
            }
          }
        }

      }

      "user"           = @{
        "_summary" = "Perform user-related admin tasks."
        "create"   = @{
          "_command" = @{
            "summary" = "Create a user for a scratch org."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "set-alias"           = @{ "summary" = "Set an alias for the created username to reference in other CLI commands." }
              "definition-file"     = @{ "summary" = "File path to a user definition file for customizing the new user." }
              "set-unique-username" = @{ "summary" = "Force the username, if specified in the definition file or at the command line, to be unique by appending the org ID." }
              "target-org"          = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"         = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "display"  = @{
          "_command" = @{
            "summary" = "Display information about a Salesforce user."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List all locally-authenticated users of an org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "cmdt"           = @{
        "_summary" = "force cmdt commands"
        "field"    = @{
          "_summary" = "force cmdt field commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a field for a custom metadata type based on the provided field type."
              "flags"   = @{
                "help"             = @{ "summary" = "Show help for command" }
                "json"             = @{ "summary" = "Format output as json." }
                "name"             = @{ "summary" = "Unique name for the field." }
                "type"             = @{ "summary" = "Type of the field." }
                "picklist-values"  = @{
                  "summary"  = "Picklist values; required for picklist fields."
                  "multiple" = $true
                }
                "decimal-places"   = @{ "summary" = "Number of decimal places to use for number or percent fields." }
                "label"            = @{ "summary" = "Label for the field." }
                "output-directory" = @{ "summary" = "Directory to store newly-created field definition files." }
              }
            }
          }

        }

        "record"   = @{
          "_summary" = "force cmdt record commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a new record for a given custom metadata type in the current project."
              "flags"   = @{
                "help"             = @{ "summary" = "Show help for command" }
                "json"             = @{ "summary" = "Format output as json." }
                "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for; must end in ""__mdt""." }
                "record-name"      = @{ "summary" = "Name of the new record." }
                "label"            = @{ "summary" = "Label for the new record." }
                "protected"        = @{ "summary" = "Protect the record when it's in a managed package." }
                "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
                "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
              }
            }
          }

          "insert"   = @{
            "_command" = @{
              "summary" = "Generate new custom metadata type records from a CSV file."
              "flags"   = @{
                "help"             = @{ "summary" = "Show help for command" }
                "json"             = @{ "summary" = "Format output as json." }
                "csv"              = @{ "summary" = "Pathname of the CSV file." }
                "type-name"        = @{ "summary" = "API name of the custom metadata type to create a record for." }
                "input-directory"  = @{ "summary" = "Directory from which to get the custom metadata type definition from." }
                "output-directory" = @{ "summary" = "Directory to store newly-created custom metadata record files." }
                "name-column"      = @{ "summary" = "Column used to determine the name of the record." }
              }
            }
          }

        }

        "generate" = @{
          "_command" = @{
            "summary" = "Generate a custom metadata type and all its records from a Salesforce object."
            "flags"   = @{
              "help"                  = @{ "summary" = "Show help for command" }
              "json"                  = @{ "summary" = "Format output as json." }
              "target-org"            = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
              "dev-name"              = @{ "summary" = "Name of the custom metadata type." }
              "label"                 = @{ "summary" = "Label for the custom metadata type." }
              "plural-label"          = @{ "summary" = "Plural version of the label value; if blank, uses label." }
              "visibility"            = @{ "summary" = "Who can see the custom metadata type." }
              "sobject"               = @{ "summary" = "API name of the source Salesforce object used to generate the custom metadata type." }
              "ignore-unsupported"    = @{ "summary" = "Ignore unsupported field types." }
              "type-output-directory" = @{ "summary" = "Directory to store newly-created custom metadata type files." }
              "records-output-dir"    = @{ "summary" = "Directory to store newly-created custom metadata record files." }
            }
          }
        }

        "create"   = @{
          "_command" = @{
            "summary" = "Generate a new custom metadata type in the current project."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "type-name"        = @{ "summary" = "Unique object name for the custom metadata type." }
              "label"            = @{ "summary" = "Label for the custom metadata type." }
              "plural-label"     = @{ "summary" = "Plural version of the label value; if blank, uses label." }
              "visibility"       = @{ "summary" = "Who can see the custom metadata type." }
              "output-directory" = @{ "summary" = "Directory to store the newly-created custom metadata type files" }
            }
          }
        }

      }

      "community"      = @{
        "_summary" = "force community commands"
        "template" = @{
          "_summary" = "force community template commands"
          "list"     = @{
            "_command" = @{
              "summary" = "Retrieve the list of templates available in your org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "create"   = @{
          "_command" = @{
            "summary" = "Create an Experience Cloud site using a template."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "name"            = @{ "summary" = "Name of the site to create." }
              "template-name"   = @{ "summary" = "Template to use to create a site." }
              "url-path-prefix" = @{ "summary" = "URL to append to the domain created when Digital Experiences was enabled for this org." }
              "description"     = @{ "summary" = "Description of the site." }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "publish"  = @{
          "_command" = @{
            "summary" = "Publish an Experience Builder site to make it live."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the Experience Builder site to publish." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "org"            = @{
        "_summary" = "force org commands"
        "shape"    = @{
          "_summary" = "force org shape commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Create a scratch org configuration (shape) based on the specified source org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

          "delete"   = @{
            "_command" = @{
              "summary" = "Delete all org shapes for a target org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "no-prompt"   = @{ "summary" = "Don't prompt for confirmation." }
              }
            }
          }

          "list"     = @{
            "_command" = @{
              "summary" = "List all org shapes you’ve created."
              "flags"   = @{
                "help" = @{ "summary" = "Show help for command" }
                "json" = @{ "summary" = "Format output as json." }
              }
            }
          }

        }

        "snapshot" = @{
          "_summary" = "force org snapshot commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Create a snapshot of a scratch org."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "source-org"     = @{ "summary" = "ID or locally authenticated username or alias of scratch org to snapshot." }
                "name"           = @{ "summary" = "Unique name of snapshot." }
                "description"    = @{ "summary" = "Description of snapshot." }
              }
            }
          }

          "delete"   = @{
            "_command" = @{
              "summary" = "Delete a scratch org snapshot."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "snapshot"       = @{ "summary" = "Name or ID of snapshot to delete." }
              }
            }
          }

          "get"      = @{
            "_command" = @{
              "summary" = "Get details about a scratch org snapshot."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "snapshot"       = @{ "summary" = "Name or ID of snapshot to retrieve." }
              }
            }
          }

          "list"     = @{
            "_command" = @{
              "summary" = "List scratch org snapshots."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "display"  = @{
          "_command" = @{
            "summary" = "Display information about an org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "verbose"     = @{ "summary" = "Display the sfdxAuthUrl property." }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List all orgs you’ve created or authenticated to."
            "flags"   = @{
              "help"                   = @{ "summary" = "Show help for command" }
              "json"                   = @{ "summary" = "Format output as json." }
              "verbose"                = @{ "summary" = "List more information about each org." }
              "all"                    = @{ "summary" = "Include expired, deleted, and unknown-status scratch orgs." }
              "clean"                  = @{ "summary" = "Remove all local org authorizations for non-active scratch orgs. Use ""org logout"" to remove non-scratch orgs." }
              "no-prompt"              = @{ "summary" = "Don't prompt for confirmation." }
              "skip-connection-status" = @{ "summary" = "Skip retrieving the connection status of non-scratch orgs." }
            }
          }
        }

        "open"     = @{
          "_command" = @{
            "summary" = "Open your default scratch org, or another specified org, in a browser."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "private"     = @{ "summary" = "Open the org in the default browser using private (incognito) mode." }
              "browser"     = @{ "summary" = "Browser where the org opens." }
              "path"        = @{ "summary" = "Navigation URL path to open a specific page." }
              "url-only"    = @{ "summary" = "Display navigation URL, but don’t launch browser." }
              "source-file" = @{ "summary" = "Path to an ApexPage or FlexiPage to open in Lightning App Builder." }
            }
          }
        }

      }

      "auth"           = @{
        "_summary"    = "force auth commands"
        "accesstoken" = @{
          "_summary" = "force auth accesstoken commands"
          "store"    = @{
            "_command" = @{
              "summary" = "Authorize an org using an existing Salesforce access token."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
                "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
                "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
                "alias"               = @{ "summary" = "Alias for the org." }
                "no-prompt"           = @{ "summary" = "Don't prompt for confirmation." }
              }
            }
          }

        }

        "device"      = @{
          "_summary" = "force auth device commands"
          "login"    = @{
            "_command" = @{
              "summary" = "Authorize an org using a device code."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
                "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
                "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
                "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
                "alias"               = @{ "summary" = "Alias for the org." }
              }
            }
          }

        }

        "jwt"         = @{
          "_summary" = "force auth jwt commands"
          "grant"    = @{
            "_command" = @{
              "summary" = "Log in to a Salesforce org using a JSON web token (JWT)."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "username"            = @{ "summary" = "Username of the user logging in." }
                "jwt-key-file"        = @{ "summary" = "Path to a file containing the private key." }
                "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
                "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
                "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
                "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
                "alias"               = @{ "summary" = "Alias for the org." }
              }
            }
          }

        }

        "sfdxurl"     = @{
          "_summary" = "force auth sfdxurl commands"
          "store"    = @{
            "_command" = @{
              "summary" = "Authorize an org using a Salesforce DX authorization URL stored in a file or through standard input (stdin)."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "sfdx-url-file"       = @{ "summary" = "Path to a file that contains the Salesforce DX authorization URL." }
                "sfdx-url-stdin"      = @{ "summary" = "Pipe the Salesforce DX authorization URL through standard input (stdin)." }
                "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
                "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
                "alias"               = @{ "summary" = "Alias for the org." }
              }
            }
          }

        }

        "web"         = @{
          "_summary" = "force auth web commands"
          "login"    = @{
            "_command" = @{
              "summary" = "Log in to a Salesforce org using the web server flow."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "browser"             = @{ "summary" = "Browser in which to open the org." }
                "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
                "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
                "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
                "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
                "alias"               = @{ "summary" = "Alias for the org." }
              }
            }
          }

        }

        "list"        = @{
          "_command" = @{
            "summary" = "List authorization information about the orgs you created or logged into."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }

        "logout"      = @{
          "_command" = @{
            "summary" = "Log out of a Salesforce org."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Username or alias of the target org." }
              "all"        = @{ "summary" = "Include all authenticated orgs." }
              "no-prompt"  = @{ "summary" = "Don't prompt for confirmation." }
            }
          }
        }

      }

      "apex"           = @{
        "_summary" = "force apex commands"
        "log"      = @{
          "_summary" = "force apex log commands"
          "get"      = @{
            "_command" = @{
              "summary" = "Fetch the specified log or given number of most recent logs from the org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "log-id"      = @{ "summary" = "ID of the specific log to display." }
                "number"      = @{ "summary" = "Number of the most recent logs to display." }
                "output-dir"  = @{ "summary" = "Directory for saving the log files." }
              }
            }
          }

          "list"     = @{
            "_command" = @{
              "summary" = "Display a list of IDs and general information about debug logs."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

          "tail"     = @{
            "_command" = @{
              "summary" = "Activate debug logging and display logs in the terminal."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "color"           = @{ "summary" = "Apply default colors to noteworthy log lines." }
                "debug-level"     = @{ "summary" = "Debug level to set on the DEVELOPER_LOG trace flag for your user." }
                "skip-trace-flag" = @{ "summary" = "Skip trace flag setup. Assumes that a trace flag and debug level are fully set up." }
              }
            }
          }

        }

        "test"     = @{
          "_summary" = "force apex test commands"
          "report"   = @{
            "_command" = @{
              "summary" = "Display test results for a specific asynchronous test run."
              "flags"   = @{
                "help"          = @{ "summary" = "Show help for command" }
                "json"          = @{ "summary" = "Format output as json." }
                "target-org"    = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"   = @{ "summary" = "Override the api version used for api requests made by this command" }
                "test-run-id"   = @{ "summary" = "ID of the test run." }
                "code-coverage" = @{ "summary" = "Retrieve code coverage results." }
                "output-dir"    = @{ "summary" = "Directory in which to store test result files." }
                "result-format" = @{ "summary" = "Format of the results." }
              }
            }
          }

          "run"      = @{
            "_command" = @{
              "summary" = "Invoke Apex tests in an org."
              "flags"   = @{
                "help"              = @{ "summary" = "Show help for command" }
                "json"              = @{ "summary" = "Format output as json." }
                "target-org"        = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"       = @{ "summary" = "Override the api version used for api requests made by this command" }
                "code-coverage"     = @{ "summary" = "Retrieve code coverage results." }
                "output-dir"        = @{ "summary" = "Directory in which to store test run files." }
                "test-level"        = @{ "summary" = "Level of tests to run; default is RunLocalTests." }
                "class-names"       = @{
                  "summary"  = "Apex test class names to run; default is all classes."
                  "multiple" = $true
                }
                "result-format"     = @{ "summary" = "Format of the test results." }
                "suite-names"       = @{
                  "summary"  = "Apex test suite names to run."
                  "multiple" = $true
                }
                "tests"             = @{
                  "summary"  = "Apex test class names or IDs and, if applicable, test methods to run; default is all tests."
                  "multiple" = $true
                }
                "wait"              = @{ "summary" = "Sets the streaming client socket timeout in minutes; specify a longer wait time if timeouts occur frequently." }
                "synchronous"       = @{ "summary" = "Runs test methods from a single Apex class synchronously; if not specified, tests are run asynchronously." }
                "detailed-coverage" = @{ "summary" = "Display detailed code coverage per test." }
              }
            }
          }

        }

        "class"    = @{
          "_summary" = "force apex class commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate an Apex class."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Apex class." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "trigger"  = @{
          "_summary" = "force apex trigger commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate an Apex trigger."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Apex trigger" }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"     = @{ "summary" = "Salesforce object to generate a trigger on." }
                "event"       = @{
                  "summary"  = "Events that fire the trigger."
                  "multiple" = $true
                }
              }
            }
          }

        }

        "execute"  = @{
          "_command" = @{
            "summary" = "Execute anonymous Apex code entered on the command line or from a local file."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "file"        = @{ "summary" = "Path to a local file that contains Apex code." }
            }
          }
        }

      }

      "limits"         = @{
        "_summary"     = "force limits commands"
        "api"          = @{
          "_summary" = "force limits api commands"
          "display"  = @{
            "_command" = @{
              "summary" = "Display information about limits in your org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "recordcounts" = @{
          "_summary" = "force limits recordcounts commands"
          "display"  = @{
            "_command" = @{
              "summary" = "Display record counts for the specified standard or custom objects."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "sobject"     = @{
                  "summary"  = "API name of the standard or custom object for which to display record counts."
                  "multiple" = $true
                }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

      }

      "schema"         = @{
        "_summary" = "force schema commands"
        "sobject"  = @{
          "_summary" = "force schema sobject commands"
          "describe" = @{
            "_command" = @{
              "summary" = "Display the metadata for a standard or custom object or a Tooling API object."
              "flags"   = @{
                "help"            = @{ "summary" = "Show help for command" }
                "json"            = @{ "summary" = "Format output as json." }
                "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"         = @{ "summary" = "API name of the object to describe." }
                "use-tooling-api" = @{ "summary" = "Use Tooling API to display metadata for Tooling API objects." }
              }
            }
          }

          "list"     = @{
            "_command" = @{
              "summary" = "List all Salesforce objects of a specified category."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "sobject"     = @{ "summary" = "Category of objects to list." }
              }
            }
          }

        }

      }

      "package"        = @{
        "_summary"  = "force package commands"
        "install"   = @{
          "_command" = @{
            "summary" = "Install a version of a package in the target org."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "target-org"       = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"      = @{ "summary" = "Override the api version used for api requests made by this command" }
              "wait"             = @{ "summary" = "Number of minutes to wait for installation status." }
              "installation-key" = @{ "summary" = "Installation key for key-protected package (default: null)." }
              "publish-wait"     = @{ "summary" = "Maximum number of minutes to wait for the Subscriber Package Version ID to become available in the target org before canceling the install request." }
              "no-prompt"        = @{ "summary" = "Don't prompt for confirmation." }
              "package"          = @{ "summary" = "ID (starts with 04t) or alias of the package version to install." }
              "apex-compile"     = @{ "summary" = "Compile all Apex in the org and package, or only Apex in the package; unlocked packages only." }
              "security-type"    = @{ "summary" = "Security access type for the installed package. (deprecation notice: The default --security-type value will change from AllUsers to AdminsOnly in v47.0 or later.)" }
              "upgrade-type"     = @{ "summary" = "Upgrade type for the package installation; available only for unlocked packages." }
            }
          }
          "report"   = @{
            "_command" = @{
              "summary" = "Retrieve the status of a package installation request."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "request-id"  = @{ "summary" = "ID of the package install request you want to check; starts with 0Hf." }
              }
            }
          }
        }

        "installed" = @{
          "_summary" = "force package installed commands"
          "list"     = @{
            "_command" = @{
              "summary" = "List the org’s installed packages."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }

        "uninstall" = @{
          "_command" = @{
            "summary" = "Uninstall a second-generation package from the target org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "wait"        = @{ "summary" = "Number of minutes to wait for uninstall status." }
              "package"     = @{ "summary" = "ID (starts with 04t) or alias of the package version to uninstall." }
            }
          }
          "report"   = @{
            "_command" = @{
              "summary" = "Retrieve the status of a package uninstall request."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "request-id"  = @{ "summary" = "ID of the package uninstall request you want to check; starts with 06y." }
              }
            }
          }
        }

        "version"   = @{
          "_summary"        = "force package version commands"
          "create"          = @{
            "_command" = @{
              "summary" = "Create a package version in the Dev Hub org."
              "flags"   = @{
                "help"                    = @{ "summary" = "Show help for command" }
                "json"                    = @{ "summary" = "Format output as json." }
                "target-dev-hub"          = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"             = @{ "summary" = "Override the api version used for api requests made by this command" }
                "branch"                  = @{ "summary" = "Name of the branch in your source control system that the package version is based on." }
                "code-coverage"           = @{ "summary" = "Calculate and store the code coverage percentage by running the packaged Apex tests included in this package version." }
                "definition-file"         = @{ "summary" = "Path to a definition file similar to scratch org definition file that contains the list of features and org preferences that the metadata of the package version depends on." }
                "installation-key"        = @{ "summary" = "Installation key for key-protected package. (either --installation-key or --installation-key-bypass is required)" }
                "installation-key-bypass" = @{ "summary" = "Bypass the installation key requirement. (either --installation-key or --installation-key-bypass is required)" }
                "package"                 = @{ "summary" = "ID (starts with 0Ho) or alias of the package to create a version of." }
                "path"                    = @{ "summary" = "Path to the directory that contains the contents of the package." }
                "post-install-script"     = @{ "summary" = "Name of the post-install script; applies to managed packages only." }
                "post-install-url"        = @{ "summary" = "Post-install instructions URL." }
                "releasenotes-url"        = @{ "summary" = "Release notes URL." }
                "skip-ancestor-check"     = @{ "summary" = "Overrides ancestry requirements, which allows you to specify a package ancestor that isn’t the highest released package version." }
                "skip-validation"         = @{ "summary" = "Skip validation during package version creation; you can’t promote unvalidated package versions." }
                "tag"                     = @{ "summary" = "Package version’s tag." }
                "uninstall-script"        = @{ "summary" = "Uninstall script name; applies to managed packages only." }
                "version-description"     = @{ "summary" = "Description of the package version to be created; overrides the sfdx-project.json value." }
                "version-name"            = @{ "summary" = "Name of the package version to be created; overrides the sfdx-project.json value." }
                "version-number"          = @{ "summary" = "Version number of the package version to be created; overrides the sfdx-project.json value." }
                "wait"                    = @{ "summary" = "Number of minutes to wait for the package version to be created." }
                "language"                = @{ "summary" = "Language for the package." }
                "verbose"                 = @{ "summary" = "Display verbose command output." }
              }
            }
            "list"     = @{
              "_command" = @{
                "summary" = "List package version creation requests."
                "flags"   = @{
                  "help"                  = @{ "summary" = "Show help for command" }
                  "json"                  = @{ "summary" = "Format output as json." }
                  "target-dev-hub"        = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                  "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
                  "created-last-days"     = @{ "summary" = "Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today." }
                  "status"                = @{ "summary" = "Status of the version creation request, used to filter the list." }
                  "show-conversions-only" = @{ "summary" = "Filter the list output to display only converted package version." }
                  "verbose"               = @{ "summary" = "Displays additional information at a slight performance cost, such as the version name and number for each package version create request." }
                }
              }
            }
            "report"   = @{
              "_command" = @{
                "summary" = "Retrieve details about a package version creation request."
                "flags"   = @{
                  "help"                      = @{ "summary" = "Show help for command" }
                  "json"                      = @{ "summary" = "Format output as json." }
                  "target-dev-hub"            = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                  "api-version"               = @{ "summary" = "Override the api version used for api requests made by this command" }
                  "package-create-request-id" = @{ "summary" = "ID (starts with 08c) of the package version creation request you want to display." }
                }
              }
            }
          }

          "delete"          = @{
            "_command" = @{
              "summary" = "Delete a package version."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "no-prompt"      = @{ "summary" = "Don’t prompt before deleting the package version." }
                "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package version to delete." }
              }
            }
          }

          "displayancestry" = @{
            "_command" = @{
              "summary" = "Display the ancestry tree for a 2GP managed package version."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package"        = @{ "summary" = "ID or alias of the package (starts with 0Ho) or package version (starts with 04t) to display ancestry for." }
                "dot-code"       = @{ "summary" = "Display the ancestry tree in DOT code." }
                "verbose"        = @{ "summary" = "Display both the package version ID (starts with 04t) and the version number (major.minor.patch.build) in the ancestry tree." }
              }
            }
          }

          "list"            = @{
            "_command" = @{
              "summary" = "List all package versions in the Dev Hub org."
              "flags"   = @{
                "help"                  = @{ "summary" = "Show help for command" }
                "json"                  = @{ "summary" = "Format output as json." }
                "target-dev-hub"        = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
                "created-last-days"     = @{ "summary" = "Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today." }
                "concise"               = @{ "summary" = "Display limited package version details." }
                "show-conversions-only" = @{ "summary" = "Filter the list output to display only converted package version." }
                "modified-last-days"    = @{ "summary" = "Number of days since the items were modified, starting at 00:00:00 of first day to now. Use 0 for today." }
                "packages"              = @{ "summary" = "Comma-delimited list of packages (aliases or 0Ho IDs) to list." }
                "released"              = @{ "summary" = "Display released versions only (IsReleased=true)." }
                "order-by"              = @{ "summary" = "Package version fields used to order the list." }
                "verbose"               = @{ "summary" = "Display extended package version details." }
              }
            }
          }

          "promote"         = @{
            "_command" = @{
              "summary" = "Promote a package version to released."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package version to promote." }
                "no-prompt"      = @{ "summary" = "Don't prompt to confirm setting the package version as released." }
              }
            }
          }

          "report"          = @{
            "_command" = @{
              "summary" = "Retrieve details about a package version in the Dev Hub org."
              "flags"   = @{
                "help"           = @{ "summary" = "Show help for command" }
                "json"           = @{ "summary" = "Format output as json." }
                "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package to retrieve details for." }
                "verbose"        = @{ "summary" = "Display extended package version details." }
              }
            }
          }

          "update"          = @{
            "_command" = @{
              "summary" = "Update a package version."
              "flags"   = @{
                "help"                = @{ "summary" = "Show help for command" }
                "json"                = @{ "summary" = "Format output as json." }
                "target-dev-hub"      = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"         = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package"             = @{ "summary" = "ID (starts with 04t) or alias of the package to update a version of." }
                "version-name"        = @{ "summary" = "New package version name." }
                "version-description" = @{ "summary" = "New package version description." }
                "branch"              = @{ "summary" = "New package version branch." }
                "tag"                 = @{ "summary" = "New package version tag." }
                "installation-key"    = @{ "summary" = "New installation key for key-protected package (default: null)" }
              }
            }
          }

        }

        "create"    = @{
          "_command" = @{
            "summary" = "Create a package."
            "flags"   = @{
              "help"                        = @{ "summary" = "Show help for command" }
              "json"                        = @{ "summary" = "Format output as json." }
              "target-dev-hub"              = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"                 = @{ "summary" = "Override the api version used for api requests made by this command" }
              "name"                        = @{ "summary" = "Name of the package to create." }
              "package-type"                = @{ "summary" = "Type of package." }
              "description"                 = @{ "summary" = "Description of the package." }
              "no-namespace"                = @{ "summary" = "Create the package with no namespace; available only for unlocked packages." }
              "path"                        = @{ "summary" = "Path to directory that contains the contents of the package." }
              "org-dependent"               = @{ "summary" = "Depends on unpackaged metadata in the installation org; applies to unlocked packages only." }
              "error-notification-username" = @{ "summary" = "Active Dev Hub user designated to receive email notifications for package errors." }
            }
          }
        }

        "delete"    = @{
          "_command" = @{
            "summary" = "Delete a package."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "no-prompt"      = @{ "summary" = "Don’t prompt before deleting the package." }
              "package"        = @{ "summary" = "ID (starts with 0Ho) or alias of the package to delete." }
            }
          }
        }

        "list"      = @{
          "_command" = @{
            "summary" = "List all packages in the Dev Hub org."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "verbose"        = @{ "summary" = "Display extended package detail." }
            }
          }
        }

        "update"    = @{
          "_command" = @{
            "summary" = "Update package details."
            "flags"   = @{
              "help"                        = @{ "summary" = "Show help for command" }
              "json"                        = @{ "summary" = "Format output as json." }
              "target-dev-hub"              = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"                 = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package"                     = @{ "summary" = "ID (starts with 0Ho) or alias of the package to update." }
              "name"                        = @{ "summary" = "New name of the package." }
              "description"                 = @{ "summary" = "New description of the package." }
              "error-notification-username" = @{ "summary" = "Active Dev Hub user designated to receive email notifications for package errors." }
              "enable-app-analytics"        = @{ "summary" = "Enable AppExchange App Analytics usage data collection on this managed package and its components." }
            }
          }
        }

      }

      "package1"       = @{
        "_summary" = "force package1 commands"
        "version"  = @{
          "_summary" = "force package1 version commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Create a first-generation package version in the release org."
              "flags"   = @{
                "help"              = @{ "summary" = "Show help for command" }
                "json"              = @{ "summary" = "Format output as json." }
                "target-org"        = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"       = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package-id"        = @{ "summary" = "ID of the metadata package (starts with 033) of which you’re creating a new version." }
                "name"              = @{ "summary" = "Package version name." }
                "description"       = @{ "summary" = "Package version description." }
                "version"           = @{ "summary" = "Package version in major.minor format, for example, 3.2." }
                "managed-released"  = @{ "summary" = "Create a managed package version." }
                "release-notes-url" = @{ "summary" = "Release notes URL." }
                "post-install-url"  = @{ "summary" = "Post install URL." }
                "installation-key"  = @{ "summary" = "Installation key for key-protected package (default: null)." }
                "wait"              = @{ "summary" = "Minutes to wait for the package version to be created (default: 2 minutes)." }
              }
            }
            "get"      = @{
              "_command" = @{
                "summary" = "Retrieve the status of a package version creation request."
                "flags"   = @{
                  "help"        = @{ "summary" = "Show help for command" }
                  "json"        = @{ "summary" = "Format output as json." }
                  "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                  "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                  "request-id"  = @{ "summary" = "ID of the PackageUploadRequest (starts with 0HD)." }
                }
              }
            }
          }

          "display"  = @{
            "_command" = @{
              "summary" = "Display details about a first-generation package version."
              "flags"   = @{
                "help"               = @{ "summary" = "Show help for command" }
                "json"               = @{ "summary" = "Format output as json." }
                "target-org"         = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version"        = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package-version-id" = @{ "summary" = "ID (starts with 04t) of the metadata package version whose details you want to display." }
              }
            }
          }

          "list"     = @{
            "_command" = @{
              "summary" = "List package versions for the specified first-generation package or for the org."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package-id"  = @{ "summary" = "Metadata package ID (starts with 033) whose package versions you want to list." }
              }
            }
          }

        }

      }

      "alias"          = @{
        "_summary" = "force alias commands"
        "list"     = @{
          "_command" = @{
            "summary" = "List all aliases currently set on your local computer."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }

        "set"      = @{
          "_command" = @{
            "summary" = "Set one or more aliases on your local computer."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }

        "unset"    = @{
          "_command" = @{
            "summary" = "Unset one or more aliases that are currently set on your local computer."
            "flags"   = @{
              "help"      = @{ "summary" = "Show help for command" }
              "json"      = @{ "summary" = "Format output as json." }
              "all"       = @{ "summary" = "Unset all currently set aliases." }
              "no-prompt" = @{ "summary" = "Don't prompt the user for confirmation when unsetting all aliases." }
            }
          }
        }

      }

      "config"         = @{
        "_summary" = "force config commands"
        "get"      = @{
          "_command" = @{
            "summary" = "Get the value of a configuration variable."
            "flags"   = @{
              "help"    = @{ "summary" = "Show help for command" }
              "json"    = @{ "summary" = "Format output as json." }
              "verbose" = @{ "summary" = "Display whether the configuration variables are set locally or globally." }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List the configuration variables that you've previously set."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }

        "set"      = @{
          "_command" = @{
            "summary" = "Set one or more configuration variables, such as your default org."
            "flags"   = @{
              "help"   = @{ "summary" = "Show help for command" }
              "json"   = @{ "summary" = "Format output as json." }
              "global" = @{ "summary" = "Set the configuration variables globally, so they can be used from any Salesforce DX project." }
            }
          }
        }

        "unset"    = @{
          "_command" = @{
            "summary" = "Unset local or global configuration variables."
            "flags"   = @{
              "help"   = @{ "summary" = "Show help for command" }
              "json"   = @{ "summary" = "Format output as json." }
              "global" = @{ "summary" = "Unset the configuration variables globally." }
            }
          }
        }

      }

      "analytics"      = @{
        "_summary" = "force analytics commands"
        "template" = @{
          "_summary" = "force analytics template commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a simple Analytics template."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "name"        = @{ "summary" = "Name of the Analytics template." }
              }
            }
          }

        }

      }

      "project"        = @{
        "_summary" = "force project commands"
        "create"   = @{
          "_command" = @{
            "summary" = "Generate a Salesforce DX project."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "name"                = @{ "summary" = "Name of the generated project." }
              "template"            = @{ "summary" = "Template to use for project creation." }
              "output-dir"          = @{ "summary" = "Directory for saving the created files." }
              "namespace"           = @{ "summary" = "Namespace associated with this project and any connected scratch orgs." }
              "default-package-dir" = @{ "summary" = "Default package directory name." }
              "manifest"            = @{ "summary" = "Generate a manifest (package.xml) for change-set based development." }
              "api-version"         = @{ "summary" = "Will set this version as sourceApiVersion in the sfdx-project.json file" }
            }
          }
        }

      }

      "staticresource" = @{
        "_summary" = "force staticresource commands"
        "create"   = @{
          "_command" = @{
            "summary" = "Generate a static resource."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated static resource." }
              "type"        = @{ "summary" = "Content type (mime type) of the generated static resource." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "visualforce"    = @{
        "_summary"  = "force visualforce commands"
        "component" = @{
          "_summary" = "force visualforce component commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Visualforce Component."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Visualforce Component." }
                "template"    = @{ "summary" = "Template to use for file creation." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "label"       = @{ "summary" = "Visualforce Component label." }
              }
            }
          }

        }

        "page"      = @{
          "_summary" = "force visualforce page commands"
          "create"   = @{
            "_command" = @{
              "summary" = "Generate a Visualforce Page."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "name"        = @{ "summary" = "Name of the generated Visualforce Page." }
                "output-dir"  = @{ "summary" = "Directory for saving the created files." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "label"       = @{ "summary" = "Visualforce Page label." }
              }
            }
          }

        }

      }

    }

    "generate"        = @{
      "_summary" = "Create a Salesforce Function with basic scaffolding specific to a given language."
      "metadata" = @{
        "_summary"      = "generate metadata commands"
        "field"         = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new custom field on a specified object."
            "flags"   = @{
              "help"   = @{ "summary" = "Show help for command" }
              "label"  = @{ "summary" = "The field's label." }
              "object" = @{ "summary" = "The directory that contains the object's source files." }
            }
          }
        }

        "platformevent" = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new platform event."
            "flags"   = @{
              "help"  = @{ "summary" = "Show help for command" }
              "label" = @{ "summary" = "The platform event's label." }
            }
          }
        }

        "sobject"       = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new custom object."
            "flags"   = @{
              "help"                 = @{ "summary" = "Show help for command" }
              "label"                = @{ "summary" = "The custom object's label." }
              "use-default-features" = @{ "summary" = "Enable all optional features without prompting." }
            }
          }
        }

        "tab"           = @{
          "_command" = @{
            "summary" = "Generate the metadata source files for a new custom tab on a custom object."
            "flags"   = @{
              "help"      = @{ "summary" = "Show help for command" }
              "json"      = @{ "summary" = "Format output as json." }
              "object"    = @{ "summary" = "API name of the custom object you're generating a tab for." }
              "directory" = @{ "summary" = "Path to a ""tabs"" directory that will contain the source files for your new tab." }
              "icon"      = @{ "summary" = "Number from 1 to 100 that specifies the color scheme and icon for the custom tab." }
            }
          }
        }

      }

      "function" = @{
        "_command" = @{
          "summary" = "Create a Salesforce Function with basic scaffolding specific to a given language."
          "flags"   = @{
            "help"          = @{ "summary" = "Show help for command" }
            "function-name" = @{ "summary" = "Function name. Must start with a capital letter." }
            "language"      = @{ "summary" = "The language in which the function is written." }
          }
        }
      }

    }

    "info"            = @{
      "_summary"     = "Access Salesforce CLI information from the command line."
      "releasenotes" = @{
        "_summary" = "Read the Salesforce CLI release notes."
        "display"  = @{
          "_command" = @{
            "summary" = "Display Salesforce CLI release notes on the command line."
            "flags"   = @{
              "help"    = @{ "summary" = "Show help for command" }
              "json"    = @{ "summary" = "Format output as json." }
              "version" = @{ "summary" = "CLI version or tag for which to display release notes." }
            }
          }
        }

      }

    }

    "lightning"       = @{
      "_summary" = "Work with Lightning Web and Aura components."
      "generate" = @{
        "_summary"  = "Create LWC and Aura components and associated metadata."
        "app"       = @{
          "_command" = @{
            "summary" = "Generate a Lightning App."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Lightning App." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "component" = @{
          "_command" = @{
            "summary" = "Generate a bundle for an Aura component or a Lightning web component."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Lightning Component." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "type"        = @{ "summary" = "Type of the component bundle." }
            }
          }
        }

        "event"     = @{
          "_command" = @{
            "summary" = "Generate a Lightning Event."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Lightning Event." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "interface" = @{
          "_command" = @{
            "summary" = "Generate a Lightning Interface."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Lightning Interface." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "test"      = @{
          "_command" = @{
            "summary" = "Generate a Lightning test."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Lightning Test." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

    }

    "login"           = @{
      "_summary"  = "Log in to Salesforce Functions."
      "functions" = @{
        "_command" = @{
          "summary" = "Log in to Salesforce Functions."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
        "jwt"      = @{
          "_command" = @{
            "summary" = "Login using JWT instead of default web-based flow. This will authenticate you with both sf and Salesforce Functions."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "username"            = @{ "summary" = "Authentication username." }
              "keyfile"             = @{ "summary" = "Path to JWT keyfile." }
              "clientid"            = @{ "summary" = "OAuth client ID." }
              "instance-url"        = @{ "summary" = "The login URL of the instance the org lives on." }
              "alias"               = @{ "summary" = "Alias for the org." }
              "set-default"         = @{ "summary" = "Set the org as the default that all org-related commands run against." }
              "set-default-dev-hub" = @{ "summary" = "Set the org as the default Dev Hub for scratch org creation." }
            }
          }
        }
      }

    }

    "logout"          = @{
      "_summary"  = "Log out of your Salesforce Functions account."
      "functions" = @{
        "_command" = @{
          "summary" = "Log out of your Salesforce Functions account."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

    }

    "org"             = @{
      "_summary" = "Commands to create and manage orgs and scratch org users."
      "assign"   = @{
        "_summary"       = "Used to assign permissions to a user"
        "permset"        = @{
          "_command" = @{
            "summary" = "Assign a permission set to one or more users of a scratch org."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "name"         = @{
                "summary"  = "Permission set to assign."
                "multiple" = $true
              }
              "on-behalf-of" = @{
                "summary"  = "Username or alias to assign the permission set to."
                "multiple" = $true
              }
              "target-org"   = @{ "summary" = "Scratch org alias or login user." }
              "api-version"  = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "permsetlicense" = @{
          "_command" = @{
            "summary" = "Assign a permission set license to one or more users of a scratch org."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "name"         = @{
                "summary"  = "Name of the permission set license to assign."
                "multiple" = $true
              }
              "on-behalf-of" = @{
                "summary"  = "Usernames or alias to assign the permission set license to."
                "multiple" = $true
              }
              "target-org"   = @{ "summary" = "Scratch org alias or login user." }
              "api-version"  = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "create"   = @{
        "_summary" = "Used to create a user"
        "shape"    = @{
          "_command" = @{
            "summary" = "Create a scratch org configuration (shape) based on the specified source org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

        "snapshot" = @{
          "_command" = @{
            "summary" = "Create a snapshot of a scratch org."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "source-org"     = @{ "summary" = "ID or locally authenticated username or alias of scratch org to snapshot." }
              "name"           = @{ "summary" = "Unique name of snapshot." }
              "description"    = @{ "summary" = "Description of snapshot." }
            }
          }
        }

        "sandbox"  = @{
          "_command" = @{
            "summary" = "Create a sandbox org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "definition-file" = @{ "summary" = "Path to a sandbox definition file." }
              "set-default"     = @{ "summary" = "Set the sandbox org as your default org." }
              "alias"           = @{ "summary" = "Alias for the sandbox org." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the sandbox org to be ready." }
              "poll-interval"   = @{ "summary" = "Number of seconds to wait between retries." }
              "async"           = @{ "summary" = "Request the sandbox creation, but don't wait for it to complete." }
              "name"            = @{ "summary" = "Name of the sandbox org." }
              "clone"           = @{ "summary" = "Name of the sandbox org to clone." }
              "license-type"    = @{ "summary" = "Type of sandbox license." }
              "target-org"      = @{ "summary" = "Username or alias of the production org that contains the sandbox license." }
              "no-prompt"       = @{ "summary" = "Don't prompt for confirmation about the sandbox configuration." }
              "no-track-source" = @{ "summary" = "Do not use source tracking for this sandbox." }
            }
          }
        }

        "scratch"  = @{
          "_command" = @{
            "summary" = "Create a scratch org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "alias"           = @{ "summary" = "Alias for the scratch org." }
              "async"           = @{ "summary" = "Request the org, but don't wait for it to complete." }
              "set-default"     = @{ "summary" = "Set the scratch org as your default org" }
              "definition-file" = @{ "summary" = "Path to a scratch org definition file." }
              "target-dev-hub"  = @{ "summary" = "Username or alias of the Dev Hub org." }
              "no-ancestors"    = @{ "summary" = "Don't include second-generation managed package (2GP) ancestors in the scratch org." }
              "edition"         = @{ "summary" = "Salesforce edition of the scratch org. Overrides the value of the ""edition"" option in the definition file, if set." }
              "no-namespace"    = @{ "summary" = "Create the scratch org with no namespace, even if the Dev Hub has a namespace." }
              "duration-days"   = @{ "summary" = "Number of days before the org expires." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the scratch org to be ready." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "client-id"       = @{ "summary" = "Consumer key of the Dev Hub connected app." }
              "track-source"    = @{ "summary" = "Use source tracking for this scratch org. Set --no-track-source to disable source tracking." }
              "username"        = @{ "summary" = "Username of the scratch org admin user. Overrides the value of the ""username"" option in the definition file, if set." }
              "description"     = @{ "summary" = "Description of the scratch org in the Dev Hub. Overrides the value of the ""description"" option in the definition file, if set." }
              "name"            = @{ "summary" = "Name of the org, such as ""Acme Company"". Overrides the value of the ""orgName"" option in the definition file, if set." }
              "release"         = @{ "summary" = "Release of the scratch org as compared to the Dev Hub release." }
              "admin-email"     = @{ "summary" = "Email address that will be applied to the org's admin user. Overrides the value of the ""adminEmail"" option in the definition file, if set." }
              "source-org"      = @{ "summary" = "15-character ID of the org whose shape the new scratch org will be based on. Overrides the value of the ""sourceOrg"" option in the definition file, if set." }
            }
          }
        }

        "user"     = @{
          "_command" = @{
            "summary" = "Create a user for a scratch org."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "set-alias"           = @{ "summary" = "Set an alias for the created username to reference in other CLI commands." }
              "definition-file"     = @{ "summary" = "File path to a user definition file for customizing the new user." }
              "set-unique-username" = @{ "summary" = "Force the username, if specified in the definition file or at the command line, to be unique by appending the org ID." }
              "target-org"          = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"         = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "delete"   = @{
        "_summary" = "Delete scratch orgs, sandboxes, org shapes, and org snapshots."
        "shape"    = @{
          "_command" = @{
            "summary" = "Delete all org shapes for a target org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "no-prompt"   = @{ "summary" = "Don't prompt for confirmation." }
            }
          }
        }

        "snapshot" = @{
          "_command" = @{
            "summary" = "Delete a scratch org snapshot."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "snapshot"       = @{ "summary" = "Name or ID of snapshot to delete." }
            }
          }
        }

        "sandbox"  = @{
          "_command" = @{
            "summary" = "Delete a sandbox."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Sandbox alias or login user." }
              "no-prompt"  = @{ "summary" = "Don't prompt the user to confirm the deletion." }
            }
          }
        }

        "scratch"  = @{
          "_command" = @{
            "summary" = "Delete a scratch org."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Scratch org alias or login user." }
              "no-prompt"  = @{ "summary" = "Don't prompt the user to confirm the deletion." }
            }
          }
        }

      }

      "disable"  = @{
        "_summary" = "Disable source tracking in an org."
        "tracking" = @{
          "_command" = @{
            "summary" = "Prevent Salesforce CLI from tracking changes in your source files between your project and an org."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            }
          }
        }

      }

      "display"  = @{
        "_command" = @{
          "summary" = "Display information about an org."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "verbose"     = @{ "summary" = "Display the sfdxAuthUrl property." }
          }
        }
        "user"     = @{
          "_command" = @{
            "summary" = "Display information about a Salesforce user."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }
      }

      "enable"   = @{
        "_summary" = "Enable source tracking in an org."
        "tracking" = @{
          "_command" = @{
            "summary" = "Allow Salesforce CLI to track changes in your source files between your project and an org."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "target-org" = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            }
          }
        }

      }

      "generate" = @{
        "_summary" = "Generate commands for a user"
        "password" = @{
          "_command" = @{
            "summary" = "Generate a random password for scratch org users."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "on-behalf-of" = @{
                "summary"  = "Comma-separated list of usernames or aliases to assign the password to; must have been created locally with the ""org create user"" command."
                "multiple" = $true
              }
              "length"       = @{ "summary" = "Number of characters in the generated password; valid values are between 8 and 100." }
              "complexity"   = @{ "summary" = "Level of password complexity or strength; the higher the value, the stronger the password." }
              "target-org"   = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"  = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "get"      = @{
        "_summary" = "Get details about a scratch org snapshot."
        "snapshot" = @{
          "_command" = @{
            "summary" = "Get details about a scratch org snapshot."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "snapshot"       = @{ "summary" = "Name or ID of snapshot to retrieve." }
            }
          }
        }

      }

      "list"     = @{
        "summary"        = "Display record counts for the specified standard or custom objects."
        "sobject"        = @{ 
          "_summary"      = "Display record counts for the specified standard or custom objects."
          "record-counts" = @{
            "_command" = @{
              "summary" = "Display record counts for the specified standard or custom objects."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "sobject"     = @{
                  "summary"  = "API name of the standard or custom object for which to display record counts."
                  "multiple" = $true
                }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              }
            }
          }

        }
        "shape"          = @{
          "_command" = @{
            "summary" = "List all org shapes you’ve created."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }
        "snapshot"       = @{
          "_command" = @{
            "summary" = "List scratch org snapshots."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }
        "auth"           = @{
          "_command" = @{
            "summary" = "List authorization information about the orgs you created or logged into."
            "flags"   = @{
              "help" = @{ "summary" = "Show help for command" }
              "json" = @{ "summary" = "Format output as json." }
            }
          }
        }
        "limits"         = @{
          "_command" = @{
            "summary" = "Display information about limits in your org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }
        "_command"       = @{
          "summary" = "List all orgs you’ve created or authenticated to."
          "flags"   = @{
            "help"                   = @{ "summary" = "Show help for command" }
            "json"                   = @{ "summary" = "Format output as json." }
            "verbose"                = @{ "summary" = "List more information about each org." }
            "all"                    = @{ "summary" = "Include expired, deleted, and unknown-status scratch orgs." }
            "clean"                  = @{ "summary" = "Remove all local org authorizations for non-active scratch orgs. Use ""org logout"" to remove non-scratch orgs." }
            "no-prompt"              = @{ "summary" = "Don't prompt for confirmation." }
            "skip-connection-status" = @{ "summary" = "Skip retrieving the connection status of non-scratch orgs." }
          }
        }
        "metadata"       = @{
          "_command" = @{
            "summary" = "List the metadata components and properties of a specified type."
            "flags"   = @{
              "help"          = @{ "summary" = "Show help for command" }
              "json"          = @{ "summary" = "Format output as json." }
              "api-version"   = @{ "summary" = "API version to use; default is the most recent API version." }
              "target-org"    = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "output-file"   = @{ "summary" = "Pathname of the file in which to write the results." }
              "metadata-type" = @{ "summary" = "Metadata type to be retrieved, such as CustomObject; metadata type names are case-sensitive." }
              "folder"        = @{ "summary" = "Folder associated with the component; required for components that use folders; folder names are case-sensitive." }
            }
          }
        }
        "metadata-types" = @{
          "_command" = @{
            "summary" = "Display details about the metadata types that are enabled for your org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "api-version" = @{ "summary" = "API version to use; default is the most recent API version." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "output-file" = @{ "summary" = "Pathname of the file in which to write the results." }
            }
          }
        }
        "users"          = @{
          "_command" = @{
            "summary" = "List all locally-authenticated users of an org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }
      }

      "login"    = @{
        "_summary"     = "Authorize an org for use with Salesforce CLI."
        "access-token" = @{
          "_command" = @{
            "summary" = "Authorize an org using an existing Salesforce access token."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
              "no-prompt"           = @{ "summary" = "Don't prompt for confirmation." }
            }
          }
        }

        "device"       = @{
          "_command" = @{
            "summary" = "Authorize an org using a device code."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

        "jwt"          = @{
          "_command" = @{
            "summary" = "Log in to a Salesforce org using a JSON web token (JWT)."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "username"            = @{ "summary" = "Username of the user logging in." }
              "jwt-key-file"        = @{ "summary" = "Path to a file containing the private key." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

        "sfdx-url"     = @{
          "_command" = @{
            "summary" = "Authorize an org using a Salesforce DX authorization URL stored in a file or through standard input (stdin)."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "sfdx-url-file"       = @{ "summary" = "Path to a file that contains the Salesforce DX authorization URL." }
              "sfdx-url-stdin"      = @{ "summary" = "Pipe the Salesforce DX authorization URL through standard input (stdin)." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

        "web"          = @{
          "_command" = @{
            "summary" = "Log in to a Salesforce org using the web server flow."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "browser"             = @{ "summary" = "Browser in which to open the org." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

      }

      "refresh"  = @{
        "_summary" = "Refresh a sandbox org using the sandbox name."
        "sandbox"  = @{
          "_command" = @{
            "summary" = "Refresh a sandbox org using the sandbox name."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "no-auto-activate" = @{ "summary" = "Disable auto-activation of the sandbox after a successful refresh." }
              "wait"             = @{ "summary" = "Number of minutes to poll for sandbox refresh status." }
              "poll-interval"    = @{ "summary" = "Number of seconds to wait between status polling requests." }
              "async"            = @{ "summary" = "Request the sandbox refresh, but don't wait for it to complete." }
              "name"             = @{ "summary" = "Name of the existing sandbox org in your production org that you want to refresh." }
              "definition-file"  = @{ "summary" = "Path to a sandbox definition file for overriding its configuration when you refresh it." }
              "target-org"       = @{ "summary" = "Username or alias of the production org that contains the sandbox license." }
              "no-prompt"        = @{ "summary" = "Don't prompt for confirmation about the sandbox refresh." }
            }
          }
        }

      }

      "resume"   = @{
        "_summary" = "Resume an org creation that was started asynchronously, timed out, or was interrupted."
        "sandbox"  = @{
          "_command" = @{
            "summary" = "Check the status of a sandbox creation, and log in to it if it's ready."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the sandbox org to be ready." }
              "name"            = @{ "summary" = "Name of the sandbox org." }
              "job-id"          = @{ "summary" = "Job ID of the incomplete sandbox creation that you want to check the status of." }
              "use-most-recent" = @{ "summary" = "Use the most recent sandbox create request." }
              "target-org"      = @{ "summary" = "Username or alias of the production org that contains the sandbox license." }
            }
          }
        }

        "scratch"  = @{
          "_command" = @{
            "summary" = "Resume the creation of an incomplete scratch org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "job-id"          = @{ "summary" = "Job ID of the incomplete scratch org create that you want to resume." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recent incomplete scratch org." }
            }
          }
        }

      }

      "logout"   = @{
        "_command" = @{
          "summary" = "Log out of a Salesforce org."
          "flags"   = @{
            "help"       = @{ "summary" = "Show help for command" }
            "json"       = @{ "summary" = "Format output as json." }
            "target-org" = @{ "summary" = "Username or alias of the target org." }
            "all"        = @{ "summary" = "Include all authenticated orgs." }
            "no-prompt"  = @{ "summary" = "Don't prompt for confirmation." }
          }
        }
      }

      "open"     = @{
        "_command" = @{
          "summary" = "Open your default scratch org, or another specified org, in a browser."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "private"     = @{ "summary" = "Open the org in the default browser using private (incognito) mode." }
            "browser"     = @{ "summary" = "Browser where the org opens." }
            "path"        = @{ "summary" = "Navigation URL path to open a specific page." }
            "url-only"    = @{ "summary" = "Display navigation URL, but don’t launch browser." }
            "source-file" = @{ "summary" = "Path to an ApexPage or FlexiPage to open in Lightning App Builder." }
          }
        }
      }

    }

    "package"         = @{
      "_summary"  = "Commands to develop and install unlocked packages and managed 2GP packages."
      "install"   = @{
        "_command" = @{
          "summary" = "Install a version of a package in the target org."
          "flags"   = @{
            "help"             = @{ "summary" = "Show help for command" }
            "json"             = @{ "summary" = "Format output as json." }
            "target-org"       = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version"      = @{ "summary" = "Override the api version used for api requests made by this command" }
            "wait"             = @{ "summary" = "Number of minutes to wait for installation status." }
            "installation-key" = @{ "summary" = "Installation key for key-protected package (default: null)." }
            "publish-wait"     = @{ "summary" = "Maximum number of minutes to wait for the Subscriber Package Version ID to become available in the target org before canceling the install request." }
            "no-prompt"        = @{ "summary" = "Don't prompt for confirmation." }
            "package"          = @{ "summary" = "ID (starts with 04t) or alias of the package version to install." }
            "apex-compile"     = @{ "summary" = "Compile all Apex in the org and package, or only Apex in the package; unlocked packages only." }
            "security-type"    = @{ "summary" = "Security access type for the installed package. (deprecation notice: The default --security-type value will change from AllUsers to AdminsOnly in v47.0 or later.)" }
            "upgrade-type"     = @{ "summary" = "Upgrade type for the package installation; available only for unlocked packages." }
          }
        }
        "report"   = @{
          "_command" = @{
            "summary" = "Retrieve the status of a package installation request."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "request-id"  = @{ "summary" = "ID of the package install request you want to check; starts with 0Hf." }
            }
          }
        }
      }

      "installed" = @{
        "_summary" = "Command to list installed packages."
        "list"     = @{
          "_command" = @{
            "summary" = "List the org’s installed packages."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "uninstall" = @{
        "_command" = @{
          "summary" = "Uninstall a second-generation package from the target org."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "wait"        = @{ "summary" = "Number of minutes to wait for uninstall status." }
            "package"     = @{ "summary" = "ID (starts with 04t) or alias of the package version to uninstall." }
          }
        }
        "report"   = @{
          "_command" = @{
            "summary" = "Retrieve the status of a package uninstall request."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "request-id"  = @{ "summary" = "ID of the package uninstall request you want to check; starts with 06y." }
            }
          }
        }
      }

      "version"   = @{
        "_summary"        = "Commands to manage package versions."
        "create"          = @{
          "_command" = @{
            "summary" = "Create a package version in the Dev Hub org."
            "flags"   = @{
              "help"                    = @{ "summary" = "Show help for command" }
              "json"                    = @{ "summary" = "Format output as json." }
              "target-dev-hub"          = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"             = @{ "summary" = "Override the api version used for api requests made by this command" }
              "branch"                  = @{ "summary" = "Name of the branch in your source control system that the package version is based on." }
              "code-coverage"           = @{ "summary" = "Calculate and store the code coverage percentage by running the packaged Apex tests included in this package version." }
              "definition-file"         = @{ "summary" = "Path to a definition file similar to scratch org definition file that contains the list of features and org preferences that the metadata of the package version depends on." }
              "installation-key"        = @{ "summary" = "Installation key for key-protected package. (either --installation-key or --installation-key-bypass is required)" }
              "installation-key-bypass" = @{ "summary" = "Bypass the installation key requirement. (either --installation-key or --installation-key-bypass is required)" }
              "package"                 = @{ "summary" = "ID (starts with 0Ho) or alias of the package to create a version of." }
              "path"                    = @{ "summary" = "Path to the directory that contains the contents of the package." }
              "post-install-script"     = @{ "summary" = "Name of the post-install script; applies to managed packages only." }
              "post-install-url"        = @{ "summary" = "Post-install instructions URL." }
              "releasenotes-url"        = @{ "summary" = "Release notes URL." }
              "skip-ancestor-check"     = @{ "summary" = "Overrides ancestry requirements, which allows you to specify a package ancestor that isn’t the highest released package version." }
              "skip-validation"         = @{ "summary" = "Skip validation during package version creation; you can’t promote unvalidated package versions." }
              "tag"                     = @{ "summary" = "Package version’s tag." }
              "uninstall-script"        = @{ "summary" = "Uninstall script name; applies to managed packages only." }
              "version-description"     = @{ "summary" = "Description of the package version to be created; overrides the sfdx-project.json value." }
              "version-name"            = @{ "summary" = "Name of the package version to be created; overrides the sfdx-project.json value." }
              "version-number"          = @{ "summary" = "Version number of the package version to be created; overrides the sfdx-project.json value." }
              "wait"                    = @{ "summary" = "Number of minutes to wait for the package version to be created." }
              "language"                = @{ "summary" = "Language for the package." }
              "verbose"                 = @{ "summary" = "Display verbose command output." }
            }
          }
          "list"     = @{
            "_command" = @{
              "summary" = "List package version creation requests."
              "flags"   = @{
                "help"                  = @{ "summary" = "Show help for command" }
                "json"                  = @{ "summary" = "Format output as json." }
                "target-dev-hub"        = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
                "created-last-days"     = @{ "summary" = "Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today." }
                "status"                = @{ "summary" = "Status of the version creation request, used to filter the list." }
                "show-conversions-only" = @{ "summary" = "Filter the list output to display only converted package version." }
                "verbose"               = @{ "summary" = "Displays additional information at a slight performance cost, such as the version name and number for each package version create request." }
              }
            }
          }
          "report"   = @{
            "_command" = @{
              "summary" = "Retrieve details about a package version creation request."
              "flags"   = @{
                "help"                      = @{ "summary" = "Show help for command" }
                "json"                      = @{ "summary" = "Format output as json." }
                "target-dev-hub"            = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
                "api-version"               = @{ "summary" = "Override the api version used for api requests made by this command" }
                "package-create-request-id" = @{ "summary" = "ID (starts with 08c) of the package version creation request you want to display." }
              }
            }
          }
        }

        "delete"          = @{
          "_command" = @{
            "summary" = "Delete a package version."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "no-prompt"      = @{ "summary" = "Don’t prompt before deleting the package version." }
              "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package version to delete." }
            }
          }
        }

        "displayancestry" = @{
          "_command" = @{
            "summary" = "Display the ancestry tree for a 2GP managed package version."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package"        = @{ "summary" = "ID or alias of the package (starts with 0Ho) or package version (starts with 04t) to display ancestry for." }
              "dot-code"       = @{ "summary" = "Display the ancestry tree in DOT code." }
              "verbose"        = @{ "summary" = "Display both the package version ID (starts with 04t) and the version number (major.minor.patch.build) in the ancestry tree." }
            }
          }
        }

        "list"            = @{
          "_command" = @{
            "summary" = "List all package versions in the Dev Hub org."
            "flags"   = @{
              "help"                  = @{ "summary" = "Show help for command" }
              "json"                  = @{ "summary" = "Format output as json." }
              "target-dev-hub"        = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"           = @{ "summary" = "Override the api version used for api requests made by this command" }
              "created-last-days"     = @{ "summary" = "Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today." }
              "concise"               = @{ "summary" = "Display limited package version details." }
              "show-conversions-only" = @{ "summary" = "Filter the list output to display only converted package version." }
              "modified-last-days"    = @{ "summary" = "Number of days since the items were modified, starting at 00:00:00 of first day to now. Use 0 for today." }
              "packages"              = @{ "summary" = "Comma-delimited list of packages (aliases or 0Ho IDs) to list." }
              "released"              = @{ "summary" = "Display released versions only (IsReleased=true)." }
              "order-by"              = @{ "summary" = "Package version fields used to order the list." }
              "verbose"               = @{ "summary" = "Display extended package version details." }
            }
          }
        }

        "promote"         = @{
          "_command" = @{
            "summary" = "Promote a package version to released."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package version to promote." }
              "no-prompt"      = @{ "summary" = "Don't prompt to confirm setting the package version as released." }
            }
          }
        }

        "report"          = @{
          "_command" = @{
            "summary" = "Retrieve details about a package version in the Dev Hub org."
            "flags"   = @{
              "help"           = @{ "summary" = "Show help for command" }
              "json"           = @{ "summary" = "Format output as json." }
              "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package"        = @{ "summary" = "ID (starts with 04t) or alias of the package to retrieve details for." }
              "verbose"        = @{ "summary" = "Display extended package version details." }
            }
          }
        }

        "update"          = @{
          "_command" = @{
            "summary" = "Update a package version."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "target-dev-hub"      = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
              "api-version"         = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package"             = @{ "summary" = "ID (starts with 04t) or alias of the package to update a version of." }
              "version-name"        = @{ "summary" = "New package version name." }
              "version-description" = @{ "summary" = "New package version description." }
              "branch"              = @{ "summary" = "New package version branch." }
              "tag"                 = @{ "summary" = "New package version tag." }
              "installation-key"    = @{ "summary" = "New installation key for key-protected package (default: null)" }
            }
          }
        }

      }

      "create"    = @{
        "_command" = @{
          "summary" = "Create a package."
          "flags"   = @{
            "help"                        = @{ "summary" = "Show help for command" }
            "json"                        = @{ "summary" = "Format output as json." }
            "target-dev-hub"              = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
            "api-version"                 = @{ "summary" = "Override the api version used for api requests made by this command" }
            "name"                        = @{ "summary" = "Name of the package to create." }
            "package-type"                = @{ "summary" = "Type of package." }
            "description"                 = @{ "summary" = "Description of the package." }
            "no-namespace"                = @{ "summary" = "Create the package with no namespace; available only for unlocked packages." }
            "path"                        = @{ "summary" = "Path to directory that contains the contents of the package." }
            "org-dependent"               = @{ "summary" = "Depends on unpackaged metadata in the installation org; applies to unlocked packages only." }
            "error-notification-username" = @{ "summary" = "Active Dev Hub user designated to receive email notifications for package errors." }
          }
        }
      }

      "delete"    = @{
        "_command" = @{
          "summary" = "Delete a package."
          "flags"   = @{
            "help"           = @{ "summary" = "Show help for command" }
            "json"           = @{ "summary" = "Format output as json." }
            "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
            "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
            "no-prompt"      = @{ "summary" = "Don’t prompt before deleting the package." }
            "package"        = @{ "summary" = "ID (starts with 0Ho) or alias of the package to delete." }
          }
        }
      }

      "list"      = @{
        "_command" = @{
          "summary" = "List all packages in the Dev Hub org."
          "flags"   = @{
            "help"           = @{ "summary" = "Show help for command" }
            "json"           = @{ "summary" = "Format output as json." }
            "target-dev-hub" = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
            "api-version"    = @{ "summary" = "Override the api version used for api requests made by this command" }
            "verbose"        = @{ "summary" = "Display extended package detail." }
          }
        }
      }

      "update"    = @{
        "_command" = @{
          "summary" = "Update package details."
          "flags"   = @{
            "help"                        = @{ "summary" = "Show help for command" }
            "json"                        = @{ "summary" = "Format output as json." }
            "target-dev-hub"              = @{ "summary" = "Username or alias of the Dev Hub org. Not required if the ``target-dev-hub`` configuration variable is already set." }
            "api-version"                 = @{ "summary" = "Override the api version used for api requests made by this command" }
            "package"                     = @{ "summary" = "ID (starts with 0Ho) or alias of the package to update." }
            "name"                        = @{ "summary" = "New name of the package." }
            "description"                 = @{ "summary" = "New description of the package." }
            "error-notification-username" = @{ "summary" = "Active Dev Hub user designated to receive email notifications for package errors." }
            "enable-app-analytics"        = @{ "summary" = "Enable AppExchange App Analytics usage data collection on this managed package and its components." }
          }
        }
      }

    }

    "package1"        = @{
      "_summary" = "Commands to develop first-generation managed and unmanaged packages."
      "version"  = @{
        "_summary" = "Commands to manage first-generation package versions."
        "create"   = @{
          "_command" = @{
            "summary" = "Create a first-generation package version in the release org."
            "flags"   = @{
              "help"              = @{ "summary" = "Show help for command" }
              "json"              = @{ "summary" = "Format output as json." }
              "target-org"        = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"       = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package-id"        = @{ "summary" = "ID of the metadata package (starts with 033) of which you’re creating a new version." }
              "name"              = @{ "summary" = "Package version name." }
              "description"       = @{ "summary" = "Package version description." }
              "version"           = @{ "summary" = "Package version in major.minor format, for example, 3.2." }
              "managed-released"  = @{ "summary" = "Create a managed package version." }
              "release-notes-url" = @{ "summary" = "Release notes URL." }
              "post-install-url"  = @{ "summary" = "Post install URL." }
              "installation-key"  = @{ "summary" = "Installation key for key-protected package (default: null)." }
              "wait"              = @{ "summary" = "Minutes to wait for the package version to be created (default: 2 minutes)." }
            }
          }
          "get"      = @{
            "_command" = @{
              "summary" = "Retrieve the status of a package version creation request."
              "flags"   = @{
                "help"        = @{ "summary" = "Show help for command" }
                "json"        = @{ "summary" = "Format output as json." }
                "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
                "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
                "request-id"  = @{ "summary" = "ID of the PackageUploadRequest (starts with 0HD)." }
              }
            }
          }
        }

        "display"  = @{
          "_command" = @{
            "summary" = "Display details about a first-generation package version."
            "flags"   = @{
              "help"               = @{ "summary" = "Show help for command" }
              "json"               = @{ "summary" = "Format output as json." }
              "target-org"         = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version"        = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package-version-id" = @{ "summary" = "ID (starts with 04t) of the metadata package version whose details you want to display." }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "List package versions for the specified first-generation package or for the org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "package-id"  = @{ "summary" = "Metadata package ID (starts with 033) whose package versions you want to list." }
            }
          }
        }

      }

    }

    "plugins"         = @{
      "summary"   = "validate a digital signature for a npm package"
      "trust"     = @{ 
        "_summary" = "validate a digital signature for a npm package"
        "verify"   = @{
          "_command" = @{
            "summary" = "Validate a digital signature."
            "flags"   = @{
              "help"     = @{ "summary" = "Show help for command" }
              "json"     = @{ "summary" = "Format output as json." }
              "npm"      = @{ "summary" = "Specify the npm name. This can include a tag/version." }
              "registry" = @{ "summary" = "The registry name. The behavior is the same as npm." }
            }
          }
        }

      }
      "generate"  = @{
        "_command" = @{
          "summary" = "Generate a new sf plugin."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
          }
        }
      }
      "_command"  = @{
        "summary" = "List installed plugins."
        "flags"   = @{
          "help" = @{ "summary" = "Show help for command" }
          "json" = @{ "summary" = "Format output as json." }
          "core" = @{ "summary" = "Show core plugins." }
        }
      }
      "inspect"   = @{
        "_command" = @{
          "summary" = "Displays installation properties of a plugin."
          "flags"   = @{
            "json"    = @{ "summary" = "Format output as json." }
            "help"    = @{ "summary" = "Show CLI help." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "install"   = @{
        "_command" = @{
          "summary" = "Installs a plugin into the CLI.
Can be installed from npm or a git url.

Installation of a user-installed plugin will override a core plugin.

e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in the CLI without the need to patch and update the whole CLI.
"
          "flags"   = @{
            "json"    = @{ "summary" = "Format output as json." }
            "force"   = @{ "summary" = "Run yarn install with force flag." }
            "help"    = @{ "summary" = "Show CLI help." }
            "silent"  = @{ "summary" = "Silences yarn output." }
            "verbose" = @{ "summary" = "Show verbose yarn output." }
          }
        }
      }
      "add"       = @{
        "_command" = @{
          "summary" = "Installs a plugin into the CLI.
Can be installed from npm or a git url.

Installation of a user-installed plugin will override a core plugin.

e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in the CLI without the need to patch and update the whole CLI.
"
          "flags"   = @{
            "json"    = @{ "summary" = "Format output as json." }
            "force"   = @{ "summary" = "Run yarn install with force flag." }
            "help"    = @{ "summary" = "Show CLI help." }
            "silent"  = @{ "summary" = "Silences yarn output." }
            "verbose" = @{ "summary" = "Show verbose yarn output." }
          }
        }
      }
      "link"      = @{
        "_command" = @{
          "summary" = "Links a plugin into the CLI for development.
Installation of a linked plugin will override a user-installed or core plugin.

e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello' command will override the user-installed or core plugin implementation. This is useful for development work.
"
          "flags"   = @{
            "help"    = @{ "summary" = "Show CLI help." }
            "install" = @{ "summary" = "Install dependencies after linking the plugin." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "reset"     = @{
        "_command" = @{
          "summary" = "Remove all user-installed and linked plugins."
          "flags"   = @{
            "help"      = @{ "summary" = "Show help for command" }
            "hard"      = @{ "summary" = "Delete node_modules and package manager related files in addition to uninstalling plugins." }
            "reinstall" = @{ "summary" = "Reinstall all plugins after uninstalling." }
          }
        }
      }
      "uninstall" = @{
        "_command" = @{
          "summary" = "Removes a plugin from the CLI."
          "flags"   = @{
            "help"    = @{ "summary" = "Show CLI help." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "unlink"    = @{
        "_command" = @{
          "summary" = "Removes a plugin from the CLI."
          "flags"   = @{
            "help"    = @{ "summary" = "Show CLI help." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "remove"    = @{
        "_command" = @{
          "summary" = "Removes a plugin from the CLI."
          "flags"   = @{
            "help"    = @{ "summary" = "Show CLI help." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "update"    = @{
        "_command" = @{
          "summary" = "Update installed plugins."
          "flags"   = @{
            "help"    = @{ "summary" = "Show CLI help." }
            "verbose" = @{ "summary" = " " }
          }
        }
      }
      "discover"  = @{
        "_command" = @{
          "summary" = "See a list of 3rd-party sf plugins you can install."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }
    }

    "project"         = @{
      "_summary" = "Work with projects, such as deploy and retrieve metadata."
      "convert"  = @{
        "_summary" = "Commands to convert metadata from one format to another."
        "mdapi"    = @{
          "_command" = @{
            "summary" = "Convert metadata retrieved via Metadata API into the source format used in Salesforce DX projects."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "api-version"  = @{ "summary" = "Override the api version used for api requests made by this command" }
              "root-dir"     = @{ "summary" = "Root directory that contains the Metadata API-formatted metadata." }
              "output-dir"   = @{ "summary" = "Directory to store your files in after they’re converted to source format; can be an absolute or relative path." }
              "manifest"     = @{ "summary" = "File path to manifest (package.xml) of metadata types to convert." }
              "metadata-dir" = @{
                "summary"  = "Root of directory or zip file of metadata formatted files to convert."
                "multiple" = $true
              }
              "metadata"     = @{
                "summary"  = "Metadata component names to convert."
                "multiple" = $true
              }
            }
          }
        }

        "source"   = @{
          "_command" = @{
            "summary" = "Convert source-formatted files into metadata that you can deploy using Metadata API."
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "api-version"  = @{ "summary" = "API Version to use in the generated project's manifest. By default, will use the version from sfdx-project.json" }
              "root-dir"     = @{ "summary" = "Source directory other than the default package to convert." }
              "output-dir"   = @{ "summary" = "Output directory to store the Metadata API-formatted files in." }
              "package-name" = @{ "summary" = "Name of the package to associate with the metadata-formatted files." }
              "manifest"     = @{ "summary" = "Path to the manifest (package.xml) file that specifies the metadata types to convert." }
              "source-dir"   = @{
                "summary"  = "Paths to the local source files to convert."
                "multiple" = $true
              }
              "metadata"     = @{
                "summary"  = "Metadata component names to convert."
                "multiple" = $true
              }
            }
          }
        }

      }

      "delete"   = @{
        "_summary" = "Commands to delete metadata from a Salesforce org."
        "source"   = @{
          "_command" = @{
            "summary" = "Delete source from your project and from a non-source-tracked org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
              "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "check-only"      = @{ "summary" = "Validate delete command but don't delete anything from the org or the local project." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to finish." }
              "tests"           = @{
                "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                "multiple" = $true
              }
              "test-level"      = @{ "summary" = "Deployment Apex testing level." }
              "no-prompt"       = @{ "summary" = "Don't prompt for delete confirmation." }
              "metadata"        = @{
                "summary"  = "Metadata components to delete."
                "multiple" = $true
              }
              "source-dir"      = @{
                "summary"  = "Source file paths to delete."
                "multiple" = $true
              }
              "track-source"    = @{ "summary" = "If the delete succeeds, update the source tracking information." }
              "force-overwrite" = @{ "summary" = "Ignore conflict warnings and overwrite changes to the org." }
              "verbose"         = @{ "summary" = "Verbose output of the delete result." }
            }
          }
        }

        "tracking" = @{
          "_command" = @{
            "summary" = "Delete all local source tracking information."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "no-prompt"   = @{ "summary" = "Don't prompt for source tracking override confirmation." }
            }
          }
        }

      }

      "deploy"   = @{
        "_summary" = "Commands to deploy metadata to a Salesforce org."
        "pipeline" = @{
          "_summary" = "Quickly deploy a validated deployment to an org."
          "quick"    = @{
            "_command" = @{
              "summary" = "Quickly deploy a validated deployment to an org."
              "flags"   = @{
                "help"                   = @{ "summary" = "Show help for command" }
                "json"                   = @{ "summary" = "Format output as json." }
                "async"                  = @{ "summary" = "Run the command asynchronously." }
                "concise"                = @{ "summary" = "Show concise output of the command result." }
                "verbose"                = @{ "summary" = "Show verbose output of the command result." }
                "wait"                   = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
                "devops-center-username" = @{ "summary" = "Username or alias of the DevOps Center org." }
                "job-id"                 = @{ "summary" = "Job ID of the validated deployment to quick deploy." }
                "use-most-recent"        = @{ "summary" = "Use the job ID of the most recently validated deployment." }
              }
            }
          }

          "report"   = @{
            "_command" = @{
              "summary" = "Check the status of a pipeline deploy operation."
              "flags"   = @{
                "help"                   = @{ "summary" = "Show help for command" }
                "json"                   = @{ "summary" = "Format output as json." }
                "devops-center-username" = @{ "summary" = "Username or alias of the DevOps Center org." }
                "job-id"                 = @{ "summary" = "Job ID of the pipeline deployment to check the status of." }
                "use-most-recent"        = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              }
            }
          }

          "resume"   = @{
            "_command" = @{
              "summary" = "Resume watching a pipeline deploy operation."
              "flags"   = @{
                "help"                   = @{ "summary" = "Show help for command" }
                "json"                   = @{ "summary" = "Format output as json." }
                "devops-center-username" = @{ "summary" = "Username or alias of the DevOps Center org." }
                "job-id"                 = @{ "summary" = "Job ID of the pipeline deploy operation you want to resume." }
                "use-most-recent"        = @{ "summary" = "Use the job ID of the most recent deploy operation." }
                "concise"                = @{ "summary" = "Show concise output of the command result." }
                "verbose"                = @{ "summary" = "Show verbose output of the command result." }
                "wait"                   = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
              }
            }
          }

          "start"    = @{
            "_command" = @{
              "summary" = "Deploy changes from a branch to the pipeline stage’s org."
              "flags"   = @{
                "help"                       = @{ "summary" = "Show help for command" }
                "json"                       = @{ "summary" = "Format output as json." }
                "branch-name"                = @{ "summary" = "Name of the branch in the source control repository that corresponds to the pipeline stage that you want to deploy the changes to." }
                "bundle-version-name"        = @{ "summary" = "Version name of the bundle." }
                "deploy-all"                 = @{ "summary" = "Deploy all metadata in the branch to the stage's org." }
                "devops-center-project-name" = @{ "summary" = "Name of the DevOps Center project." }
                "devops-center-username"     = @{ "summary" = "Username or alias of the DevOps Center org." }
                "tests"                      = @{
                  "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                  "multiple" = $true
                }
                "test-level"                 = @{ "summary" = "Deployment Apex testing level." }
                "async"                      = @{ "summary" = "Run the command asynchronously." }
                "wait"                       = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
                "verbose"                    = @{ "summary" = "Show verbose output of the command result." }
                "concise"                    = @{ "summary" = "Show concise output of the command result." }
              }
            }
          }

          "validate" = @{
            "_command" = @{
              "summary" = "Perform a validate-only deployment from a branch to the pipeline stage’s org."
              "flags"   = @{
                "help"                       = @{ "summary" = "Show help for command" }
                "json"                       = @{ "summary" = "Format output as json." }
                "branch-name"                = @{ "summary" = "Name of the branch in the source control repository that corresponds to the pipeline stage that you want to deploy the changes to." }
                "bundle-version-name"        = @{ "summary" = "Version name of the bundle." }
                "deploy-all"                 = @{ "summary" = "Deploy all metadata in the branch to the stage's org." }
                "devops-center-project-name" = @{ "summary" = "Name of the DevOps Center project." }
                "devops-center-username"     = @{ "summary" = "Username or alias of the DevOps Center org." }
                "tests"                      = @{
                  "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                  "multiple" = $true
                }
                "test-level"                 = @{ "summary" = "Deployment Apex testing level." }
                "async"                      = @{ "summary" = "Run the command asynchronously." }
                "wait"                       = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
                "verbose"                    = @{ "summary" = "Show verbose output of the command result." }
                "concise"                    = @{ "summary" = "Show concise output of the command result." }
              }
            }
          }

        }

        "cancel"   = @{
          "_command" = @{
            "summary" = "Cancel a deploy operation."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "async"           = @{ "summary" = "Run the command asynchronously." }
              "job-id"          = @{ "summary" = "Job ID of the deploy operation you want to cancel." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
            }
          }
        }

        "preview"  = @{
          "_command" = @{
            "summary" = "Preview a deployment to see what will deploy to the org, the potential conflicts, and the ignored files."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "ignore-conflicts" = @{ "summary" = "Don't display conflicts in preview of the deployment." }
              "manifest"         = @{ "summary" = "Full file path for manifest (package.xml) of components to preview." }
              "metadata"         = @{
                "summary"  = "Metadata component names to preview."
                "multiple" = $true
              }
              "source-dir"       = @{
                "summary"  = "Path to the local source files to preview."
                "multiple" = $true
              }
              "target-org"       = @{ "summary" = "Login username or alias for the target org." }
              "concise"          = @{ "summary" = "Show only the changes that will be deployed; omits files that are forceignored." }
            }
          }
        }

        "quick"    = @{
          "_command" = @{
            "summary" = "Quickly deploy a validated deployment to an org."
            "flags"   = @{
              "help"            = @{ "summary" = "Show help for command" }
              "json"            = @{ "summary" = "Format output as json." }
              "async"           = @{ "summary" = "Run the command asynchronously." }
              "concise"         = @{ "summary" = "Show concise output of the deploy result." }
              "job-id"          = @{ "summary" = "Job ID of the deployment you want to quick deploy." }
              "target-org"      = @{ "summary" = "Login username or alias for the target org." }
              "use-most-recent" = @{ "summary" = "Use the job ID of the most recently validated deployment." }
              "verbose"         = @{ "summary" = "Show verbose output of the deploy result." }
              "wait"            = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "api-version"     = @{ "summary" = "Target API version for the deploy." }
            }
          }
        }

        "report"   = @{
          "_command" = @{
            "summary" = "Check or poll for the status of a deploy operation."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "target-org"          = @{ "summary" = "Login username or alias for the target org." }
              "job-id"              = @{ "summary" = "Job ID of the deploy operation you want to check the status of." }
              "use-most-recent"     = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "coverage-formatters" = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"               = @{ "summary" = "Output JUnit test results." }
              "results-dir"         = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
              "wait"                = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
            }
          }
        }

        "resume"   = @{
          "_command" = @{
            "summary" = "Resume watching a deploy operation and update source tracking when the deploy completes."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "concise"             = @{ "summary" = "Show concise output of the deploy operation result." }
              "job-id"              = @{ "summary" = "Job ID of the deploy operation you want to resume." }
              "use-most-recent"     = @{ "summary" = "Use the job ID of the most recent deploy operation." }
              "verbose"             = @{ "summary" = "Show verbose output of the deploy operation result." }
              "wait"                = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "coverage-formatters" = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"               = @{ "summary" = "Output JUnit test results." }
              "results-dir"         = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
            }
          }
        }

        "start"    = @{
          "_command" = @{
            "summary" = "Deploy metadata to an org from your local project."
            "flags"   = @{
              "help"                     = @{ "summary" = "Show help for command" }
              "json"                     = @{ "summary" = "Format output as json." }
              "api-version"              = @{ "summary" = "Target API version for the deploy." }
              "async"                    = @{ "summary" = "Run the command asynchronously." }
              "concise"                  = @{ "summary" = "Show concise output of the deploy result." }
              "dry-run"                  = @{ "summary" = "Validate deploy and run Apex tests but don’t save to the org." }
              "ignore-conflicts"         = @{ "summary" = "Ignore conflicts and deploy local files, even if they overwrite changes in the org." }
              "ignore-errors"            = @{ "summary" = "Ignore any errors and don’t roll back deployment." }
              "ignore-warnings"          = @{ "summary" = "Ignore warnings and allow a deployment to complete successfully." }
              "manifest"                 = @{ "summary" = "Full file path for manifest (package.xml) of components to deploy." }
              "metadata"                 = @{
                "summary"  = "Metadata component names to deploy. Wildcards (``*`` ) supported as long as you use quotes, such as ``ApexClass:MyClass*``."
                "multiple" = $true
              }
              "metadata-dir"             = @{ "summary" = "Root of directory or zip file of metadata formatted files to deploy." }
              "single-package"           = @{ "summary" = "Indicates that the metadata zip file points to a directory structure for a single package." }
              "source-dir"               = @{
                "summary"  = "Path to the local source files to deploy."
                "multiple" = $true
              }
              "target-org"               = @{ "summary" = "Login username or alias for the target org." }
              "tests"                    = @{
                "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                "multiple" = $true
              }
              "test-level"               = @{ "summary" = "Deployment Apex testing level." }
              "verbose"                  = @{ "summary" = "Show verbose output of the deploy result." }
              "wait"                     = @{ "summary" = "Number of minutes to wait for command to complete and display results." }
              "purge-on-delete"          = @{ "summary" = "Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin." }
              "pre-destructive-changes"  = @{ "summary" = "File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy." }
              "post-destructive-changes" = @{ "summary" = "File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy." }
              "coverage-formatters"      = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"                    = @{ "summary" = "Output JUnit test results." }
              "results-dir"              = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
            }
          }
        }

        "validate" = @{
          "_command" = @{
            "summary" = "Validate a metadata deployment without actually executing it."
            "flags"   = @{
              "help"                     = @{ "summary" = "Show help for command" }
              "json"                     = @{ "summary" = "Format output as json." }
              "api-version"              = @{ "summary" = "Target API version for the validation." }
              "async"                    = @{ "summary" = "Run the command asynchronously." }
              "concise"                  = @{ "summary" = "Show concise output of the validation result." }
              "manifest"                 = @{ "summary" = "Full file path for manifest (package.xml) of components to validate for deployment." }
              "metadata"                 = @{
                "summary"  = "Metadata component names to validate for deployment."
                "multiple" = $true
              }
              "source-dir"               = @{
                "summary"  = "Path to the local source files to validate for deployment."
                "multiple" = $true
              }
              "metadata-dir"             = @{ "summary" = "Root of directory or zip file of metadata formatted files to deploy." }
              "single-package"           = @{ "summary" = "Indicates that the metadata zip file points to a directory structure for a single package." }
              "target-org"               = @{ "summary" = "Login username or alias for the target org." }
              "tests"                    = @{
                "summary"  = "Apex tests to run when --test-level is RunSpecifiedTests."
                "multiple" = $true
              }
              "test-level"               = @{ "summary" = "Deployment Apex testing level." }
              "verbose"                  = @{ "summary" = "Show verbose output of the validation result." }
              "wait"                     = @{ "summary" = "Number of minutes to wait for the command to complete and display results." }
              "ignore-warnings"          = @{ "summary" = "Ignore warnings and allow a deployment to complete successfully." }
              "coverage-formatters"      = @{
                "summary"  = "Format of the code coverage results."
                "multiple" = $true
              }
              "junit"                    = @{ "summary" = "Output JUnit test results." }
              "results-dir"              = @{ "summary" = "Output directory for code coverage and JUnit results; defaults to the deploy ID." }
              "purge-on-delete"          = @{ "summary" = "Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin." }
              "pre-destructive-changes"  = @{ "summary" = "File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy" }
              "post-destructive-changes" = @{ "summary" = "File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy." }
            }
          }
        }

      }

      "generate" = @{
        "manifest" = @{
          "_command" = @{
            "summary" = "Create a project manifest that lists the metadata components you want to deploy or retrieve."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "api-version"      = @{ "summary" = "Override the api version used for api requests made by this command" }
              "metadata"         = @{
                "summary"  = "Names of metadata components to include in the manifest."
                "multiple" = $true
              }
              "source-dir"       = @{
                "summary"  = "Paths to the local source files to include in the manifest."
                "multiple" = $true
              }
              "name"             = @{ "summary" = "Name of a custom manifest file to create." }
              "type"             = @{ "summary" = "Type of manifest to create; the type determines the name of the created file." }
              "include-packages" = @{
                "summary"  = "Package types (managed, unlocked) whose metadata is included in the manifest; by default, metadata in packages is ignored."
                "multiple" = $true
              }
              "from-org"         = @{ "summary" = "Username or alias of the org that contains the metadata components from which to build a manifest." }
              "output-dir"       = @{ "summary" = "Directory to save the created manifest." }
            }
          }
        }
        "_command" = @{
          "summary" = "Generate a Salesforce DX project."
          "flags"   = @{
            "help"                = @{ "summary" = "Show help for command" }
            "json"                = @{ "summary" = "Format output as json." }
            "name"                = @{ "summary" = "Name of the generated project." }
            "template"            = @{ "summary" = "Template to use for project creation." }
            "output-dir"          = @{ "summary" = "Directory for saving the created files." }
            "namespace"           = @{ "summary" = "Namespace associated with this project and any connected scratch orgs." }
            "default-package-dir" = @{ "summary" = "Default package directory name." }
            "manifest"            = @{ "summary" = "Generate a manifest (package.xml) for change-set based development." }
            "api-version"         = @{ "summary" = "Will set this version as sourceApiVersion in the sfdx-project.json file" }
          }
        }
      }

      "list"     = @{
        "_summary" = "Commands to list metadata in a Salesforce project."
        "ignored"  = @{
          "_command" = @{
            "summary" = "Check your local project package directories for forceignored files."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "json"       = @{ "summary" = "Format output as json." }
              "source-dir" = @{ "summary" = "File or directory of files that the command checks for foreceignored files." }
            }
          }
        }

      }

      "reset"    = @{
        "_summary" = "Commands to reset the source tracking state."
        "tracking" = @{
          "_command" = @{
            "summary" = "Reset local and remote source tracking."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "revision"    = @{ "summary" = "SourceMember revision counter number to reset to." }
              "no-prompt"   = @{ "summary" = "Don't prompt for source tracking override confirmation." }
            }
          }
        }

      }

      "retrieve" = @{
        "_summary" = "Commands to retrieve metadata from a Salesforce org"
        "preview"  = @{
          "_command" = @{
            "summary" = "Preview a retrieval to see what will be retrieved from the org, the potential conflicts, and the ignored files."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "ignore-conflicts" = @{ "summary" = "Don't display conflicts in the preview of the retrieval." }
              "target-org"       = @{ "summary" = "Login username or alias for the target org." }
              "concise"          = @{ "summary" = "Show only the changes that will be retrieved; omits files that are forceignored." }
            }
          }
        }

        "start"    = @{
          "_command" = @{
            "summary" = "Retrieve metadata from an org to your local project."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "api-version"         = @{ "summary" = "Target API version for the retrieve." }
              "ignore-conflicts"    = @{ "summary" = "Ignore conflicts and retrieve and save files to your local filesystem, even if they overwrite your local changes." }
              "manifest"            = @{ "summary" = "File path for the manifest (package.xml) that specifies the components to retrieve." }
              "metadata"            = @{
                "summary"  = "Metadata component names to retrieve. Wildcards (``*``) supported as long as you use quotes, such as ``ApexClass:MyClass*``."
                "multiple" = $true
              }
              "package-name"        = @{
                "summary"  = "Package names to retrieve."
                "multiple" = $true
              }
              "output-dir"          = @{ "summary" = "Directory root for the retrieved source files." }
              "single-package"      = @{ "summary" = "Indicates that the zip file points to a directory structure for a single package." }
              "source-dir"          = @{
                "summary"  = "File paths for source to retrieve from the org."
                "multiple" = $true
              }
              "target-metadata-dir" = @{ "summary" = "Directory that will contain the retrieved metadata format files or ZIP." }
              "target-org"          = @{ "summary" = "Login username or alias for the target org." }
              "wait"                = @{ "summary" = "Number of minutes to wait for the command to complete and display results to the terminal window." }
              "unzip"               = @{ "summary" = "Extract all files from the retrieved zip file." }
              "zip-file-name"       = @{ "summary" = "File name to use for the retrieved zip file." }
            }
          }
        }

      }

    }

    "run"             = @{
      "_summary" = "Send a cloudevent to a function."
      "function" = @{
        "start"    = @{
          "_command" = @{
            "summary" = "Build and run a Salesforce Function."
            "flags"   = @{
              "help"       = @{ "summary" = "Show help for command" }
              "port"       = @{ "summary" = "Port for running the function." }
              "debug-port" = @{ "summary" = "Port for remote debugging." }
              "language"   = @{ "summary" = "The language that the function runs in." }
              "verbose"    = @{ "summary" = "Output additional logs." }
            }
          }
        }
        "_command" = @{
          "summary" = "Send a cloudevent to a function."
          "flags"   = @{
            "help"          = @{ "summary" = "Show help for command" }
            "json"          = @{ "summary" = "Format output as json." }
            "function-url"  = @{ "summary" = "URL of the function to run." }
            "headers"       = @{
              "summary"  = "Set headers."
              "multiple" = $true
            }
            "payload"       = @{ "summary" = "Set the payload of the cloudevent as a JSON object or a path to a file via @file.json." }
            "structured"    = @{ "summary" = "Set the cloudevent to be emitted as a structured JSON cloudevent." }
            "connected-org" = @{ "summary" = "Username or alias for the target org; overrides default target org." }
          }
        }
      }

    }

    "scanner"         = @{
      "_summary" = "add custom rules to Salesforce Code Analyzer's registry"
      "rule"     = @{
        "_summary" = "add custom rules to Salesforce Code Analyzer's registry"
        "add"      = @{
          "_command" = @{
            "summary" = "add custom rules to Salesforce Code Analyzer's registry"
            "flags"   = @{
              "help"     = @{ "summary" = "Show help for command" }
              "json"     = @{ "summary" = "Format output as json." }
              "language" = @{ "summary" = "language that the custom rules are evaluated against" }
              "path"     = @{
                "summary"  = "one or more paths (such as a directory or JAR file) to custom rule definitions"
                "multiple" = $true
              }
            }
          }
        }

        "describe" = @{
          "_command" = @{
            "summary" = "provide detailed information about a rule"
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "rulename"     = @{ "summary" = "the name of the rule" }
              "verbose"      = @{ "summary" = "emit additional command output to stdout" }
              "preview-pmd7" = @{ "summary" = "use PMD version 7.0.0-rc4 to describe PMD and CPD rules" }
            }
          }
        }

        "list"     = @{
          "_command" = @{
            "summary" = "list basic information about all rules matching provided criteria"
            "flags"   = @{
              "help"         = @{ "summary" = "Show help for command" }
              "json"         = @{ "summary" = "Format output as json." }
              "verbose"      = @{ "summary" = "emit additional command output to stdout" }
              "category"     = @{
                "summary"  = "select rules by category"
                "multiple" = $true
              }
              "ruleset"      = @{
                "summary"  = "[Deprecated] select rules by ruleset"
                "multiple" = $true
              }
              "language"     = @{
                "summary"  = "select rules by language"
                "multiple" = $true
              }
              "engine"       = @{
                "summary"  = "select rules by engine"
                "multiple" = $true
              }
              "preview-pmd7" = @{ "summary" = "use PMD version 7.0.0-rc4 to list PMD and CPD rules" }
            }
          }
        }

        "remove"   = @{
          "_command" = @{
            "summary" = "remove custom rules from the registry of available rules"
            "flags"   = @{
              "help"    = @{ "summary" = "Show help for command" }
              "json"    = @{ "summary" = "Format output as json." }
              "verbose" = @{ "summary" = "emit additional command output to stdout" }
              "force"   = @{ "summary" = "bypass the confirmation prompt and immediately remove the rules" }
              "path"    = @{
                "summary"  = "one or more paths to remove"
                "multiple" = $true
              }
            }
          }
        }

      }

      "run"      = @{
        "_command" = @{
          "summary" = "scan a codebase with a selection of rules"
          "flags"   = @{
            "help"               = @{ "summary" = "Show help for command" }
            "json"               = @{ "summary" = "Format output as json." }
            "verbose"            = @{ "summary" = "emit additional command output to stdout" }
            "category"           = @{
              "summary"  = "one or more categories of rules to run"
              "multiple" = $true
            }
            "format"             = @{ "summary" = "specify results output format" }
            "outfile"            = @{ "summary" = "write output to a file" }
            "severity-threshold" = @{ "summary" = "throw an error when a violation threshold is reached, the --normalize-severity is invoked, and severity levels are reset to the baseline" }
            "normalize-severity" = @{ "summary" = "return normalized severity 1 (high), 2 (moderate), and 3 (low), and the engine-specific severity" }
            "projectdir"         = @{
              "summary"  = "root directory of project"
              "multiple" = $true
            }
            "ruleset"            = @{
              "summary"  = "[Deprecated] rulesets to run"
              "multiple" = $true
            }
            "engine"             = @{
              "summary"  = "specify which engines to run"
              "multiple" = $true
            }
            "target"             = @{
              "summary"  = "source code location"
              "multiple" = $true
            }
            "tsconfig"           = @{ "summary" = "location of tsconfig.json file" }
            "eslintconfig"       = @{ "summary" = "specify the location of eslintrc config to customize eslint engine" }
            "pmdconfig"          = @{ "summary" = "specify location of PMD rule reference XML file to customize rule selection" }
            "preview-pmd7"       = @{ "summary" = "use PMD version 7.0.0-rc4 when running PMD and CPD" }
            "env"                = @{ "summary" = "[Deprecated] override ESLint's default environment variables, in JSON-formatted string" }
            "verbose-violations" = @{ "summary" = "return retire-js violation message details" }
          }
        }
        "dfa"      = @{
          "_command" = @{
            "summary" = "scan codebase with all DFA rules"
            "flags"   = @{
              "help"                           = @{ "summary" = "Show help for command" }
              "json"                           = @{ "summary" = "Format output as json." }
              "verbose"                        = @{ "summary" = "emit additional command output to stdout" }
              "category"                       = @{
                "summary"  = "one or more categories of rules to run"
                "multiple" = $true
              }
              "format"                         = @{ "summary" = "specify results output format" }
              "outfile"                        = @{ "summary" = "write output to a file" }
              "severity-threshold"             = @{ "summary" = "throw an error when a violation threshold is reached, the --normalize-severity is invoked, and severity levels are reset to the baseline" }
              "normalize-severity"             = @{ "summary" = "return normalized severity 1 (high), 2 (moderate), and 3 (low), and the engine-specific severity" }
              "projectdir"                     = @{
                "summary"  = "root directory of project"
                "multiple" = $true
              }
              "with-pilot"                     = @{ "summary" = "allow pilot rules to execute" }
              "target"                         = @{
                "summary"  = "source code location"
                "multiple" = $true
              }
              "rule-thread-count"              = @{ "summary" = "specify number of threads that evaluate DFA rules. Alternatively, set value using environment variable ``SFGE_RULE_THREAD_COUNT``. Default is 4" }
              "rule-thread-timeout"            = @{ "summary" = "specify timeout for individual rule threads in milliseconds. Alternatively, set the timeout value using environment variable ``SFGE_RULE_THREAD_TIMEOUT``. Default: 900000 ms" }
              "rule-disable-warning-violation" = @{ "summary" = "disable warning violations from Salesforce Graph Engine. Alternatively, set value using environment variable ``SFGE_RULE_DISABLE_WARNING_VIOLATION``" }
              "sfgejvmargs"                    = @{ "summary" = "specify Java Virtual Machine (JVM) arguments to optimize Salesforce Graph Engine execution to your system (optional)" }
              "pathexplimit"                   = @{ "summary" = "specify a path expansion  upper boundary to limit the complexity of code that Graph Engine analyzes. Alternatively, set the value using environment variable ``SFGE_PATH_EXPANSION_LIMIT``" }
            }
          }
        }
      }

    }

    "schema"          = @{
      "_summary" = "Generate metadata files."
      "generate" = @{
        "_summary"      = "Generate metadata files for various Salesforce database schema."
        "field"         = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new custom field on a specified object."
            "flags"   = @{
              "help"   = @{ "summary" = "Show help for command" }
              "label"  = @{ "summary" = "The field's label." }
              "object" = @{ "summary" = "The directory that contains the object's source files." }
            }
          }
        }

        "platformevent" = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new platform event."
            "flags"   = @{
              "help"  = @{ "summary" = "Show help for command" }
              "label" = @{ "summary" = "The platform event's label." }
            }
          }
        }

        "sobject"       = @{
          "_command" = @{
            "summary" = "Generate metadata source files for a new custom object."
            "flags"   = @{
              "help"                 = @{ "summary" = "Show help for command" }
              "label"                = @{ "summary" = "The custom object's label." }
              "use-default-features" = @{ "summary" = "Enable all optional features without prompting." }
            }
          }
        }

        "tab"           = @{
          "_command" = @{
            "summary" = "Generate the metadata source files for a new custom tab on a custom object."
            "flags"   = @{
              "help"      = @{ "summary" = "Show help for command" }
              "json"      = @{ "summary" = "Format output as json." }
              "object"    = @{ "summary" = "API name of the custom object you're generating a tab for." }
              "directory" = @{ "summary" = "Path to a ""tabs"" directory that will contain the source files for your new tab." }
              "icon"      = @{ "summary" = "Number from 1 to 100 that specifies the color scheme and icon for the custom tab." }
            }
          }
        }

      }

    }

    "sobject"         = @{
      "_summary" = "Commands to interact with Salesforce objects."
      "describe" = @{
        "_command" = @{
          "summary" = "Display the metadata for a standard or custom object or a Tooling API object."
          "flags"   = @{
            "help"            = @{ "summary" = "Show help for command" }
            "json"            = @{ "summary" = "Format output as json." }
            "target-org"      = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version"     = @{ "summary" = "Override the api version used for api requests made by this command" }
            "sobject"         = @{ "summary" = "API name of the object to describe." }
            "use-tooling-api" = @{ "summary" = "Use Tooling API to display metadata for Tooling API objects." }
          }
        }
      }

      "list"     = @{
        "_command" = @{
          "summary" = "List all Salesforce objects of a specified category."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            "sobject"     = @{ "summary" = "Category of objects to list." }
          }
        }
      }

    }

    "static-resource" = @{
      "_summary" = "Work with static resources."
      "generate" = @{
        "_command" = @{
          "summary" = "Generate a static resource."
          "flags"   = @{
            "help"        = @{ "summary" = "Show help for command" }
            "json"        = @{ "summary" = "Format output as json." }
            "name"        = @{ "summary" = "Name of the generated static resource." }
            "type"        = @{ "summary" = "Content type (mime type) of the generated static resource." }
            "output-dir"  = @{ "summary" = "Directory for saving the created files." }
            "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
          }
        }
      }

    }

    "update"          = @{
      "_command" = @{
        "summary" = "update the sf CLI"
        "flags"   = @{
          "help"        = @{ "summary" = "Show help for command" }
          "available"   = @{ "summary" = "See available versions." }
          "force"       = @{ "summary" = "Force a re-download of the requested version." }
          "interactive" = @{ "summary" = "Interactively select version to install. This is ignored if a channel is provided." }
          "version"     = @{ "summary" = "Install a specific version." }
        }
      }
    }

    "version"         = @{
      "_command" = @{
        "summary" = " "
        "flags"   = @{
          "help"    = @{ "summary" = "Show help for command" }
          "json"    = @{ "summary" = "Format output as json." }
          "verbose" = @{ "summary" = "Show additional information about the CLI." }
        }
      }
    }

    "visualforce"     = @{
      "_summary" = "Work with Visualforce components."
      "generate" = @{
        "_summary"  = "Create a Visualforce page or component."
        "component" = @{
          "_command" = @{
            "summary" = "Generate a Visualforce Component."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Visualforce Component." }
              "template"    = @{ "summary" = "Template to use for file creation." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "label"       = @{ "summary" = "Visualforce Component label." }
            }
          }
        }

        "page"      = @{
          "_command" = @{
            "summary" = "Generate a Visualforce Page."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "name"        = @{ "summary" = "Name of the generated Visualforce Page." }
              "output-dir"  = @{ "summary" = "Directory for saving the created files." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
              "label"       = @{ "summary" = "Visualforce Page label." }
            }
          }
        }

      }

    }

    "whoami"          = @{
      "_summary"  = "Show information on your Salesforce Functions login."
      "functions" = @{
        "_command" = @{
          "summary" = "Show information on your Salesforce Functions login."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

    }

    "auth"            = @{
      "_summary"    = "auth commands"
      "accesstoken" = @{
        "_summary" = "auth accesstoken commands"
        "store"    = @{
          "_command" = @{
            "summary" = "Authorize an org using an existing Salesforce access token."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
              "no-prompt"           = @{ "summary" = "Don't prompt for confirmation." }
            }
          }
        }

      }

      "device"      = @{
        "_summary" = "auth device commands"
        "login"    = @{
          "_command" = @{
            "summary" = "Authorize an org using a device code."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

      }

      "jwt"         = @{
        "_summary" = "auth jwt commands"
        "grant"    = @{
          "_command" = @{
            "summary" = "Log in to a Salesforce org using a JSON web token (JWT)."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "username"            = @{ "summary" = "Username of the user logging in." }
              "jwt-key-file"        = @{ "summary" = "Path to a file containing the private key." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

      }

      "sfdxurl"     = @{
        "_summary" = "auth sfdxurl commands"
        "store"    = @{
          "_command" = @{
            "summary" = "Authorize an org using a Salesforce DX authorization URL stored in a file or through standard input (stdin)."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "sfdx-url-file"       = @{ "summary" = "Path to a file that contains the Salesforce DX authorization URL." }
              "sfdx-url-stdin"      = @{ "summary" = "Pipe the Salesforce DX authorization URL through standard input (stdin)." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

      }

      "web"         = @{
        "_summary" = "auth web commands"
        "login"    = @{
          "_command" = @{
            "summary" = "Log in to a Salesforce org using the web server flow."
            "flags"   = @{
              "help"                = @{ "summary" = "Show help for command" }
              "json"                = @{ "summary" = "Format output as json." }
              "browser"             = @{ "summary" = "Browser in which to open the org." }
              "client-id"           = @{ "summary" = "OAuth client ID (also called consumer key) of your custom connected app." }
              "instance-url"        = @{ "summary" = "URL of the instance that the org lives on." }
              "set-default-dev-hub" = @{ "summary" = "Set the authenticated org as the default Dev Hub." }
              "set-default"         = @{ "summary" = "Set the authenticated org as the default that all org-related commands run against." }
              "alias"               = @{ "summary" = "Alias for the org." }
            }
          }
        }

      }

      "list"        = @{
        "_command" = @{
          "summary" = "List authorization information about the orgs you created or logged into."
          "flags"   = @{
            "help" = @{ "summary" = "Show help for command" }
            "json" = @{ "summary" = "Format output as json." }
          }
        }
      }

      "logout"      = @{
        "_command" = @{
          "summary" = "Log out of a Salesforce org."
          "flags"   = @{
            "help"       = @{ "summary" = "Show help for command" }
            "json"       = @{ "summary" = "Format output as json." }
            "target-org" = @{ "summary" = "Username or alias of the target org." }
            "all"        = @{ "summary" = "Include all authenticated orgs." }
            "no-prompt"  = @{ "summary" = "Don't prompt for confirmation." }
          }
        }
      }

    }

    "retrieve"        = @{
      "_summary" = "retrieve commands"
      "metadata" = @{
        "preview"  = @{
          "_command" = @{
            "summary" = "Preview a retrieval to see what will be retrieved from the org, the potential conflicts, and the ignored files."
            "flags"   = @{
              "help"             = @{ "summary" = "Show help for command" }
              "json"             = @{ "summary" = "Format output as json." }
              "ignore-conflicts" = @{ "summary" = "Don't display conflicts in the preview of the retrieval." }
              "target-org"       = @{ "summary" = "Login username or alias for the target org." }
              "concise"          = @{ "summary" = "Show only the changes that will be retrieved; omits files that are forceignored." }
            }
          }
        }
        "_command" = @{
          "summary" = "Retrieve metadata from an org to your local project."
          "flags"   = @{
            "help"                = @{ "summary" = "Show help for command" }
            "json"                = @{ "summary" = "Format output as json." }
            "api-version"         = @{ "summary" = "Target API version for the retrieve." }
            "ignore-conflicts"    = @{ "summary" = "Ignore conflicts and retrieve and save files to your local filesystem, even if they overwrite your local changes." }
            "manifest"            = @{ "summary" = "File path for the manifest (package.xml) that specifies the components to retrieve." }
            "metadata"            = @{
              "summary"  = "Metadata component names to retrieve. Wildcards (``*``) supported as long as you use quotes, such as ``ApexClass:MyClass*``."
              "multiple" = $true
            }
            "package-name"        = @{
              "summary"  = "Package names to retrieve."
              "multiple" = $true
            }
            "output-dir"          = @{ "summary" = "Directory root for the retrieved source files." }
            "single-package"      = @{ "summary" = "Indicates that the zip file points to a directory structure for a single package." }
            "source-dir"          = @{
              "summary"  = "File paths for source to retrieve from the org."
              "multiple" = $true
            }
            "target-metadata-dir" = @{ "summary" = "Directory that will contain the retrieved metadata format files or ZIP." }
            "target-org"          = @{ "summary" = "Login username or alias for the target org." }
            "wait"                = @{ "summary" = "Number of minutes to wait for the command to complete and display results to the terminal window." }
            "unzip"               = @{ "summary" = "Extract all files from the retrieved zip file." }
            "zip-file-name"       = @{ "summary" = "File name to use for the retrieved zip file." }
          }
        }
      }

    }

    "limits"          = @{
      "_summary"     = "limits commands"
      "api"          = @{
        "_summary" = "limits api commands"
        "display"  = @{
          "_command" = @{
            "summary" = "Display information about limits in your org."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

      "recordcounts" = @{
        "_summary" = "limits recordcounts commands"
        "display"  = @{
          "_command" = @{
            "summary" = "Display record counts for the specified standard or custom objects."
            "flags"   = @{
              "help"        = @{ "summary" = "Show help for command" }
              "json"        = @{ "summary" = "Format output as json." }
              "sobject"     = @{
                "summary"  = "API name of the standard or custom object for which to display record counts."
                "multiple" = $true
              }
              "target-org"  = @{ "summary" = "Username or alias of the target org. Not required if the ``target-org`` configuration variable is already set." }
              "api-version" = @{ "summary" = "Override the api version used for api requests made by this command" }
            }
          }
        }

      }

    }

    "commands"        = @{
      "_command" = @{
        "summary" = "list all the commands"
        "flags"   = @{
          "json"        = @{ "summary" = "Format output as json." }
          "deprecated"  = @{ "summary" = "show deprecated commands" }
          "help"        = @{ "summary" = "Show CLI help." }
          "hidden"      = @{ "summary" = "show hidden commands" }
          "tree"        = @{ "summary" = "show tree of commands" }
          "columns"     = @{ "summary" = "only show provided columns (comma-separated)" }
          "csv"         = @{ "summary" = "output is csv format [alias: --output=csv]" }
          "extended"    = @{ "summary" = "show extra columns" }
          "filter"      = @{ "summary" = "filter property by partial string matching, ex: name=foo" }
          "no-header"   = @{ "summary" = "hide table header from output" }
          "no-truncate" = @{ "summary" = "do not truncate output to fit screen" }
          "output"      = @{ "summary" = "output in a more machine friendly format" }
          "sort"        = @{ "summary" = "property to sort by (prepend '-' for descending)" }
        }
      }
    }

    "search"          = @{
      "_command" = @{
        "summary" = "Search for a command."
        "flags"   = @{
          "help" = @{ "summary" = "Show help for command" }
        }
      }
    }

    "autocomplete"    = @{
      "_command" = @{
        "summary" = "Display autocomplete installation instructions."
        "flags"   = @{
          "help"          = @{ "summary" = "Show help for command" }
          "refresh-cache" = @{ "summary" = "Refresh cache (ignores displaying instructions)" }
        }
      }
    }

    "which"           = @{
      "_command" = @{
        "summary" = "Show which plugin a command is in."
        "flags"   = @{
          "help" = @{ "summary" = "Show help for command" }
          "json" = @{ "summary" = "Format output as json." }
        }
      }
    }

    "help"            = @{
      "_command" = @{
        "summary" = "Display help for sf."
        "flags"   = @{
          "help"            = @{ "summary" = "Show help for command" }
          "nested-commands" = @{ "summary" = "Include all nested commands in the output." }
        }
      }
    }

    "doctor"          = @{
      "_command" = @{
        "summary" = "Gather CLI configuration data and run diagnostic tests to discover and report potential problems in your environment."
        "flags"   = @{
          "help"         = @{ "summary" = "Show help for command" }
          "json"         = @{ "summary" = "Format output as json." }
          "command"      = @{ "summary" = "Command to run in debug mode; results are written to a log file." }
          "plugin"       = @{ "summary" = "Specific plugin on which to run diagnostics." }
          "output-dir"   = @{ "summary" = "Directory to save all created files rather than the current working directory." }
          "create-issue" = @{ "summary" = "Create a new issue on our GitHub repo and attach all diagnostic results." }
        }
      }
    }

    "whatsnew"        = @{
      "_command" = @{
        "summary" = "Display Salesforce CLI release notes on the command line."
        "flags"   = @{
          "help"    = @{ "summary" = "Show help for command" }
          "json"    = @{ "summary" = "Format output as json." }
          "version" = @{ "summary" = "CLI version or tag for which to display release notes." }
        }
      }
    }

  }

  # Get the current mode
  $Mode = (Get-PSReadLineKeyHandler | Where-Object { $_.Key -eq "Tab" }).Function

  # Everything in the current line except the CLI executable name.
  $CurrentLine = $commandAst.CommandElements[1..$commandAst.CommandElements.Count] -split " "

  # Remove $WordToComplete from the current line.
  if ($WordToComplete -ne "") {
    if ($CurrentLine.Count -eq 1) {
      $CurrentLine = @()
    }
    else {
      $CurrentLine = $CurrentLine[0..$CurrentLine.Count]
    }
  }

  # Save flags in current line without the `--` prefix.
  $Flags = $CurrentLine | Where-Object {
    $_ -Match "^-{1,2}(\w+)"
  } | ForEach-Object {
    $_.trim("-")
  }
  # Set $flags to an empty hashtable if there are no flags in the current line.
  if ($Flags -eq $null) {
    $Flags = @{}
  }

  # No command in the current line, suggest top-level args.
  if ($CurrentLine.Count -eq 0) {
    $Commands.GetEnumerator() | Where-Object {
      $_.Key.StartsWith("$WordToComplete")
    } | Sort-Object -Property Key | ForEach-Object {
      New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList `
      ($(if ($Mode -eq "MenuComplete") { "$($_.Key) " } else { "$($_.Key)" })),
      $_.Key,
      'ParameterValue',
      ($_.Value._summary -or $_.Value._command.summary -or '')
    }
  }
  else {
    # Start completing command/topic/coTopic

    $NextArg = $null
    $PrevNode = $null

    # Iterate over the current line to find the command/topic/coTopic hashtable
    $CurrentLine | ForEach-Object {
      if ($NextArg -eq $null) {
        $NextArg = $Commands[$_]
      }
      elseif ($PrevNode[$_] -ne $null) {
        $NextArg = $PrevNode[$_]
      }
      elseif ($_.StartsWith('-')) {
        return
      }
      else {
        $NextArg = $PrevNode
      }

      $PrevNode = $NextArg
    }

    # Start completing command.
    if ($NextArg._command -ne $null) {
      # Complete flags
      # `cli config list -<TAB>`
      if ($WordToComplete -like '-*') {
        $NextArg._command.flags.GetEnumerator() | Sort-Object -Property key | Where-Object {
          # Filter out already used flags (unless `flag.multiple = true`).
          $_.Key.StartsWith("$($WordToComplete.Trim("-"))") -and ($_.Value.multiple -eq $true -or !$flags.Contains($_.Key))
      } | ForEach-Object {
          New-Object -Type CompletionResult -ArgumentList `
            $($Mode -eq "MenuComplete" ? "--$($_.Key) " : "--$($_.Key)"),
              $_.Key,
              "ParameterValue",
              ($NextArg._command.flags[$_.Key].summary ?? '')
      }
      
  }
  else {
      # This could be a coTopic. We remove the "_command" hashtable
      # from $NextArg and check if there's a command under the current partial ID.
      $NextArg.remove("_command")

      if ($NextArg.keys -gt 0) {
          $NextArg.GetEnumerator() | Where-Object {
              $_.Key.StartsWith("$WordToComplete")
          } | Sort-Object -Property key | ForEach-Object {
              New-Object -Type CompletionResult -ArgumentList `
                  $($Mode -eq "MenuComplete" ? "$($_.Key) " : "$($_.Key)"),
                  $_.Key,
                  "ParameterValue",
                  ($NextArg[$_.Key]._summary ?? '')
          }
      }
  }
}
else {
  # Start completing topic.

  # Topic summary is stored as "_summary" in the hashtable.
  # At this stage it is no longer needed so we remove it
  # so that $NextArg contains only commands/topics hashtables

  $NextArg.remove("_summary")

  $NextArg.GetEnumerator() | Where-Object {
      $_.Key.StartsWith("$WordToComplete")
  } | Sort-Object -Property key | ForEach-Object {
      New-Object -Type CompletionResult -ArgumentList `
          $($Mode -eq "MenuComplete" ? "$($_.Key) " : "$($_.Key)"),
          $_.Key,
          "ParameterValue",
          ($NextArg[$_.Key]._summary ?? $NextArg[$_.Key]._command.summary ?? '')
  }
}

Register-ArgumentCompleter -Native -CommandName @("sfdx", "sf") -ScriptBlock $scriptblock
