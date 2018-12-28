######################################################################################

#Scritp to do the multiple arithmatic operation live Add, Sub, Mul, Div

#Author: Kundan Patil

#Version; 1.0

######################################################################################

#Define the Funtciotn

Function do-calculation
    {

        [cmdletbinding()]

           Param(
  [Parameter(Mandatory = $true, 
             HelpMessage="Enter First Number")]
  [ValidateNotNullOrEmpty()]
  [int]$FirstNumber,

  [Parameter(Mandatory = $true, 
             HelpMessage="Enter Second Number")]
  [ValidateNotNullOrEmpty()]
  [int]$SecondNumber,

  [Parameter(Mandatory = $true,
             HelpMessage="Enter the operation name which you want to perform")]
  [ValidateNotNullOrEmpty()]
  [ValidateSet("ADD", "SUB", "MUL", "DIV")]
  [string]$operation

  )

  Begin{Write-Host "Calculating" -ForegroundColor Blue}
        
        
        Process{
        
        
                    if ($operation -match "ADD")
                    {
                    $out=$FirstNumber + $SecondNumber
                    Write-Host "You have requested addtion, so the addition of your provided number is $out" -ForegroundColor Green
                    
                    }
                    
                    if ($operation -match "SUB")
                    {
                    $out=$FirstNumber - $SecondNumber
                    Write-Host "You have requested Subtraction, so the Subtraction of your provided number is $out" -ForegroundColor Green 
                                        
                    } 
                    
                    if ($operation -match "MUL")
                    {
                    $out=$FirstNumber * $SecondNumber
                    Write-Host "You have requested Multiplication, so the multiplicaiton of your provided number is $out" -ForegroundColor Green
                    
                    }    
                    
                    if ($operation -match "DIV")
                    {
                    $out=$FirstNumber / $SecondNumber
                    Write-Host "You have requested Division, so the division of your provided number is $out" -ForegroundColor Green
                    
                    }          
        
        
        
                }

                
                End{Write-Host "Hope you got the desired output" -ForegroundColor Magenta}



    }

    
    
    
    

