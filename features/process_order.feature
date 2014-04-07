

  Background:
    Given we have the following stock:
      |Name| Min Stock Level| Stock Level |
      |Nuts| 100 | 120 |
      |Bolts| 100 | 70 |

  Scenario: Processing an order
    When I order 90 bolts
    Then the stock level should be 
