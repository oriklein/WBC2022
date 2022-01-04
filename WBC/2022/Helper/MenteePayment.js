var gControlNamePrefix = "ctl00$CPHPageContent$";
var gFormName = 0;
var Today = new Date();

/*
There are three functions in this set for credit card validation.
The main function is:
validateCard(cardNumber,cardType,cardMonth,cardYear)
parameters:
all paramaters are string values.
Month & Year come from the select input fields in the form, so they are defined.
cardType can be:
'AX' for American Express
'DS' for Discover
'CA' for MasterCard
'VI' for Visa
'JC' for JCB
description:
this function will check string length, valid characters, specific credit card prefixes and test
the Mod 10 (LUHN Formula) for validating possible credit card numbers. this function can only
authorize that the given card data is potentially valid. You would still need to run actual
card validation routines to verify the actual account.
returns:
this function returns true if the card number could be valid for the card type and expiration date.
false otherwise.

supporting functions:
mod10( cardNumber )
parameters:
this function takes the text string card number and runs the Mod 10 formula on its respective digits.
description:
Mod 10 is the check digit formula for the supported cards these functions attempt to validate.
returns:
this function returns true if the number passes the check digit test.
false otherwise.

expired( cardMonth, cardYear )
parameters:
this function takes the text string values given by the html form.
description:
this function basically will check to make sure todays date is less than the expiration date the user inputs.
this function is not locked into using 2 digit dates.
returns:
this fucntion returns true if the card is expired.
false otherwise.
*/

function mod10( cardNumber )	// LUHN Formula for validation of credit card numbers.
{
	var ar = new Array( cardNumber.length );
	var i = 0,sum = 0;

	for( i = 0; i < cardNumber.length; ++i ) 
	{
		ar[i] = parseInt(cardNumber.charAt(i));
	}

	for( i = ar.length -2; i >= 0; i-=2 )       // you have to start from the right, and work back.
	{ 
		ar[i] *= 2;                             // every second digit starting with the right most (check digit)
		if( ar[i] > 9 ) ar[i]-=9;               // will be doubled, and summed with the skipped digits.
	}                                           // if the double digit is > 9, ADD those individual digits together

	for( i = 0; i < ar.length; ++i )
	{
		sum += ar[i];                           // if the sum is divisible by 10 mod10 succeeds
	}
	return (((sum%10)==0)?true:false);
}
    
function validateCard(cardNumber, cardType)
{
	if( cardNumber.length == 0 )                //most of these checks are self explanitory
	{
		alert("Please enter a valid card number.");
		return false;
	}

	for( var i = 0; i < cardNumber.length; ++i )// make sure the number is all digits.. (by design)
	{
		var c = cardNumber.charAt(i);

		if( c < '0' || c > '9' )
		{
			alert("Please enter a valid card number. Use only digits. do not use spaces or hyphens.");
			return false;
		}
	}

	var length = cardNumber.length;		//perform card specific length and prefix tests

	switch( cardType )
	{
		case 'AX':
			if( length != 15 )
			{
				alert("Please enter a valid American Express Card number.");
				return false;
			}

			var prefix = parseInt( cardNumber.substring(0,2));

			if( prefix != 34 && prefix != 37 )
			{
				alert("Please enter a valid American Express Card number.");
				return false;
			}
			break;

		case 'DS':
			if( length != 16 )
			{
				alert("Please enter a valid Discover Card number.");
				return false;
			}
			var prefix = parseInt( cardNumber.substring(0,4));

			if( prefix != 6011 )
			{
				alert("Please enter a valid Discover Card number.");
				return false;
			}
			break;

		case 'MC':
			if( length != 16 )
			{
				alert("Please enter a valid MasterCard number.");
				return false;
			}

			var prefix = parseInt( cardNumber.substring(0,2));
			if( prefix < 51 || prefix > 55)
			{
				alert("Please enter a valid MasterCard Card number.");
				return false;
			}
			break;

		case 'DC':
			if( length != 14 )
			{
				alert("Please enter a valid Diners Club Card number.");
				return false;
			}
			var prefix = parseInt( cardNumber.substring(0,2));
			if( prefix != 30 && prefix != 36 && prefix != 38)
			{
				alert("Please enter a valid Diners Club Card number.");
				return false;
			}
			break;

		case 'VI':
			if( length != 16 && length != 13 )
			{
				alert("Please enter a valid Visa Card number.");
				return false;
			}
			var prefix = parseInt( cardNumber.substring(0,1));

			if( prefix != 4 )
			{
				alert("Please enter a valid Visa Card number.");
				return false;
			}
			break;
		case 'JC':
			if( length != 16 && length != 15 )
			{
				alert("Please enter a valid JCB Card number.");
				return false;
			}
			var prefix = parseInt( cardNumber.substring(0,1));
			if(length == 16)
			{
				if( prefix != 3 )
				{
					alert("Please enter a valid JCB Card number.");
					return false;
				}
			}
			else if(length == 15)
			{
				prefix = parseInt( cardNumber.substring(0,3));
				if( prefix != 2131 || prefix != 1800 )
				{
					alert("Please enter a valid JCB Card number.");
					return false;
				}
			}
			break;
	}

	if( !mod10( cardNumber ) ) 		        // run the check digit algorithm
	{
		alert("Sorry! this is not a valid credit card number.");
		return false;
	}
	return true;                                // at this point card has not been proven to be invalid
}

/* function expired( month, year, currentDate) {
var now = new Date(currentDate);			// this function is designed to be Y2K compliant.
var expiresIn = new Date(year,month,0,0,0);	// create an expired on date object with valid thru expiration date
//alert(expiresIn);
//        	expiresIn.setMonth(expiresIn.getMonth()+1);	// adjust the month, to first day, hour, minute & second of expired month

if( now.getTime() < expiresIn.getTime() ) return false;
return true;				// then we get the miliseconds, and do a long integer comparison
}*/

// Added on April 22 2004 (function expired)
function expired(month, year, CurrentDate)
{
	year = "20"+year;
	month = parseInt(month);
	year = parseInt(year);
	if(month > 12 || month < 1)
	{
		alert("The expiration month is invalid.");
		return false;
	}

	//var currentDate=String(CurrentDate);
	var InputDate = new Date(year,month,0)
	if(InputDate > Today) return true;
	else
	{
		alert("Sorry! The expiration date you have entered would make this card invalid.");
		return false;
	}
}

function checkMenteeDetails()
{
	if(validateForm(gFormName))
	{
		var CardType = document.forms[gFormName].elements[gControlNamePrefix+"SelRCard_Type"];
		var CardNumber = document.forms[gFormName].elements[gControlNamePrefix+"IntRCard_Number"];
		var CardMonth = document.forms[gFormName].elements[gControlNamePrefix+"SelRExpiration_Date_Month"];
		var CardYear = document.forms[gFormName].elements[gControlNamePrefix+"SelRExpiration_Date_Year"];

		if(validateCard(CardNumber.value, CardType.value))
		{
			if(expired(CardMonth.value, CardYear.value, Today))
			{
				return true;
			}
			else
			{
				CardMonth.focus();
				return false;
			}
		}
		else
		{
			CardNumber.focus();
			return false;
		}
	}
	else return false;
}
function askAlert()
{
	//if(confirm("Do you want to proceed?")) return true;
	//else return false;
}