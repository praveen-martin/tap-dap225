
@feature_open_create_job_opening
Feature: OpenCreateNewJobOpeningFor

  Background: 
    Given the user is on the Job Opening screen

  @open-create-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When the user locates the Add Job Opening button
    And the user clicks on the Add Job Opening button
    Then the Create New Job Opening form is displayed
    And the form contains fields for job title, description, requirements, and other relevant information
    And the form displays Save and Cancel buttons

  Examples:
    | job_title | description | requirements | other_relevant_information |
    | Example Job Title | Example Description | Example Requirements | Example Other Information |

  @button_enabled_validation
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is filled with <job_title>
    And the job description field is filled with <job_description>
    And the job requirements field is filled with <job_requirements>
    Then the Save button should be enabled
    And the Cancel button should remain enabled

    Examples:
      | job_title              | job_description                                                        | job_requirements                                               |
      | Software Engineer      | Responsible for developing and maintaining software applications.      | Bachelor's degree in Computer Science, 3+ years of experience in software development. |

  @cancel_button_functionality
  Scenario Outline: Open Create New Job Opening Form
    When the user clicks on the Cancel button in the Create New Job Opening form
    Then the Create New Job Opening form is closed
    And the user is returned to the Job Opening screen

  Examples:
    | action                       |
    | Click on the Cancel button   |

@empty_required_fields_validation
Scenario Outline: Open Create New Job Opening Form
  When the user leaves the job title field <job_title> 
  And the user leaves the job description field <job_description>
  And the user leaves the job requirements field <job_requirements>
  And the user clicks the Save button
  Then validation messages are displayed for the empty job title field
  And validation messages are displayed for the empty job description field
  And validation messages are displayed for the empty job requirements field
  And the Save button remains disabled

Examples:
  | job_title | job_description | job_requirements |
  |           |                  |                   |

  @validation-error-check
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title field with <job_title>
    And the user leaves the job description field empty
    And the user fills in the job requirements field with <job_requirements>
    When the user clicks the Save button
    Then validation messages are displayed for the empty job description field
    And the job title field retains the entered value
    And the job requirements field retains the entered value

    Examples:
      | job_title            | job_requirements                                                                                     |
      | Software Engineer    | Bachelor's degree in Computer Science, 3+ years of experience in software development, proficiency in Java and Python |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user has entered the job title <job_title>
    And the user has filled in the job description <job_description>
    And the user has filled in the requirements <requirements>
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the special characters in the title

    Examples:
      | job_title                   | job_description | requirements |
      | Senior Developer @ XYZ     | a * 100         | a * 100      |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the admin enters <job_requirements> in the job requirements field
    And the admin enters <job_title> in the job title field
    And the admin enters <job_description> in the job description field
    When the admin clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with numeric values in the requirements

    Examples:
      | job_requirements | job_title          | job_description                                           |
      | 5                | Software Engineer   | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    When I enter <requirements> in the job requirements field
    And I fill in the job title with <job_title>
    And I fill in the job description with <job_description>
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with all job requirements listed

    Examples:
      | requirements                                      | job_title       | job_description                                           |
      | 5+ years experience; Proficient in Java; Team player | Software Engineer | Responsible for developing and maintaining software applications. |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user fills in the job title with <job_title>
    And the user fills in the description with <description>
    And the user leaves the salary field empty
    And the user leaves the location field empty
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the optional fields left empty

    Examples:
      | job_title            | description                                   |
      | Software Engineer    | Develop and maintain software applications.   |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters "<job_description>" in the job description field
    And the user fills in "<job_title>" as the job title
    And the user fills in "<job_requirements>" as the job requirements
    When the user clicks the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with special characters in the description

    Examples:
      | job_description                                         | job_title         | job_requirements                          |
      | Looking for a developer with experience in C# & .NET | Software Developer | Must have experience in C#, .NET, and SQL. |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters a job title with leading and trailing whitespace <job_title>
  And the user fills in the job description with <job_description>
  And the user fills in the job requirements with <job_requirements>
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the job title trimmed of whitespace

Examples:
  | job_title               | job_description         | job_requirements         |
  | " Senior Developer "    | "Job description a * 100" | "Job requirements a * 100" |

  @valid-job-opening
  Scenario Outline: Open Create New Job Opening Form
    Given the job description is "<job_description>"
    And the job title is "<job_title>"
    And the requirements are "<requirements>"
    When I fill in the job description
    And I fill in the job title
    And I fill in the requirements
    And I click the Save button
    Then the form saves successfully without any validation errors
    And the job opening is created with the HTML tags rendered correctly

    Examples:
      | job_description                     | job_title          | requirements |
      | <b>Looking for a developer</b>     | Software Developer  | a * 100     |

@valid-job-opening
Scenario Outline: Open Create New Job Opening Form
  Given the user enters "<job_description>" in the job description field
  And the user fills in the job title as "<job_title>"
  And the user fills in the requirements as "<requirements>"
  When the user clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with the email format included in the description

  Examples:
    | job_description                     | job_title         | requirements                                         |
    | Contact us at hr@example.com       | Software Engineer  | Experience with automation testing and CI/CD tools. |

  @save_button_disabled
  Scenario Outline: Open Create New Job Opening Form
    Given the job title field is <job_title>
    And I fill in the job description field with <job_description>
    And I fill in the job requirements field with <job_requirements>
    Then the Save button should be disabled
    And the Cancel button should remain enabled

    Examples:
      | job_title | job_description                                                                 | job_requirements                                               |
      |           | A valid job description that provides a clear overview of the job responsibilities and expectations. | A list of valid job requirements that are necessary for the position. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job title "<job_title>"
    And the user enters the job description "<job_description>"
    And the user enters the job requirements "<job_requirements>"
    When the user clicks the Save button
    Then an error message is displayed indicating the job title is too short
    And the Save button remains disabled

    Examples:
      | job_title | job_description                                                        | job_requirements                     |
      | A         | This is a valid job description that meets the requirements.          | These are the valid job requirements. |

  @invalid-job-description
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters a job description that exceeds the maximum character limit
    When the user fills in the job title with <job_title>
    And the user fills in the requirements with <requirements>
    And the user clicks the Save button
    Then an error message should be displayed indicating the job description exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | requirements                                                                                      |
      | Software Engineer   | Bachelor's degree in Computer Science or related field, 3 years of experience in software development, proficiency in Java and Python. |

@duplicate-job-title
Scenario Outline: Open Create New Job Opening Form
  Given the user enters the job title <job_title>
  And the user fills in the job description <job_description>
  And the user fills in the requirements <requirements>
  When the user clicks the Save button
  Then an error message is displayed indicating the job title already exists
  And the Save button remains disabled

  Examples:
    | job_title            | job_description                                      | requirements                                               |
    | Software Engineer    | Develop and maintain software applications.         | Bachelor's degree in Computer Science or related field, 3+ years of experience. |

  @invalid-job-title
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters "<job_title>" as the job title
    And the user fills in the job description with "<job_description>"
    And the user fills in the requirements with "<requirements>"
    When the user clicks the Save button
    Then an error message should be displayed indicating invalid characters in the job title
    And the Save button should remain disabled

    Examples:
      | job_title      | job_description                                                                 | requirements                                                                  |
      | Developer #1   | Job description aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | Requirements aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @job_title_exceeds_limit
  Scenario Outline: Open Create New Job Opening Form
    When I enter a job title that exceeds the maximum character limit
    And I fill in the job description with valid data
    And I fill in the requirements with valid data
    And I click the Save button
    Then an error message is displayed indicating the job title exceeds the character limit
    And the Save button remains disabled

    Examples:
      | job_title                                               | job_description | requirements |
      | This is a very long job title that exceeds the limit   | a * 100        | a * 100      |

  @exceed_character_limit
  Scenario Outline: Open Create New Job Opening Form
    Given the user enters job requirements that exceed the maximum character limit
    And the user fills in the job title with <job_title>
    And the user fills in the job description with <job_description>
    When the user clicks the Save button
    Then an error message is displayed indicating the job requirements exceed the character limit
    And the Save button remains disabled

    Examples:
      | job_title          | job_description                                                                                     |
      | Software Engineer   | We are looking for a skilled software engineer with experience in developing applications.          |

@max-character-limit
Scenario Outline: Open Create New Job Opening Form
  Given the admin enters a job title that meets the maximum character limit
  And the admin enters a job description that meets the maximum character limit
  And the admin enters job requirements that meet the maximum character limit
  When the admin clicks the Save button
  Then the form saves successfully without any validation errors
  And the job opening is created with all fields populated to their maximum limits

Examples:
  | job_title         | job_description    | job_requirements    |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
  | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

  @empty-fields-validation
  Scenario Outline: Open Create New Job Opening Form
    When the Admin leaves all fields empty
    And the Admin clicks the Save button
    Then validation messages are displayed for all required fields
    And the Save button remains disabled

  Examples:
    |  |
    |  |
