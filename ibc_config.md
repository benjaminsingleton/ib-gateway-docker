# IBC Configuration Settings

The `ibc/config.ini.tmpl` file contains settings to configure the operation of the IBC application, which is used to automate the startup and configuration of the Interactive Brokers Trader Workstation (TWS) or IB Gateway.

## 1. IBC Startup Settings

### FIX

Used to start the IB Gateway for the FIX CTCI. Set to 'yes' to run the FIX CTCI gateway. Default is 'no'.

```
FIX=no
```

## 2. Authentication Settings

### IB API Authentication Settings

#### IbLoginId

Your TWS username.

```
IbLoginId=${TWS_USERID}
```

#### IbPassword

Your TWS password.

```
IbPassword=${TWS_PASSWORD}
```

### FIX CTCI Authentication Settings

#### FIXLoginId

Your FIX CTCI username.

```
FIXLoginId=
```

#### FIXPassword

Your FIX CTCI password.

```
FIXPassword=
```

### Second Factor Authentication Settings

#### SecondFactorDevice

Instructs IBC to select a particular device for second factor authentication. Leave blank to manually select the device.

```
SecondFactorDevice=
```

#### ReloginAfterSecondFactorAuthenticationTimeout

Specifies whether to automatically restart the login sequence if second factor authentication times out. Permitted values are 'yes' and 'no'. Default is value of `ExitAfterSecondFactorAuthenticationTimeout`, or 'no' if not set.

```
ReloginAfterSecondFactorAuthenticationTimeout=${RELOGIN_AFTER_TWOFA_TIMEOUT}
```

#### SecondFactorAuthenticationExitInterval

Specifies how long (in seconds) IBC waits for login to complete after user acknowledges the second factor authentication alert. Default is 60.

```
SecondFactorAuthenticationExitInterval=${TWOFA_EXIT_INTERVAL}
```

#### SecondFactorAuthenticationTimeout

Specifies the timeout for second factor authentication imposed by IB, in seconds. Default is 180.

```
SecondFactorAuthenticationTimeout=180
```

#### ExitAfterSecondFactorAuthenticationTimeout (DEPRECATED)

THIS SETTING WILL BE REMOVED IN A FUTURE RELEASE. See `ReloginAfterSecondFactorAuthenticationTimeout` for IBC version 3.14.0 and later.

```
ExitAfterSecondFactorAuthenticationTimeout=no
```

### Trading Mode

Indicates whether to use the live account or paper trading account. Allowed values are 'live' (default) and 'paper'.

```
TradingMode=${TRADING_MODE}
```

### Paper-trading Account Warning

Set to 'yes' to automatically confirm the non-brokerage account warning for paper trading accounts. Default is 'yes'.

```
AcceptNonBrokerageAccountWarning=yes
```

### Login Dialog Display Timeout

Specifies how long (in seconds) IBC waits for the login dialog before restarting TWS. Default is 60.

```
LoginDialogDisplayTimeout=60  
```

### Store settings on server

Set to 'yes' to store TWS settings on IB's servers for sharing across computers. Leave blank to use last login location.

```
StoreSettingsOnServer=
```

### Minimize TWS on startup

Set to 'yes' to minimize TWS when it starts.

```
MinimizeMainWindow=no
```

### Existing Session Detected Action

Specifies how TWS should proceed when an existing session is detected. Allowed values are 'secondary', 'primary', 'primaryoverride' and 'manual' (default).

```
ExistingSessionDetectedAction=primary
```

### Override TWS API Port Number

Set to an integer to override the 'Socket port' in TWS's API configuration. Leave blank for no change. 

```
OverrideTwsApiPort=
```

### Override TWS Master Client ID

Set to an integer to override the 'Master Client ID' value in TWS's API configuration. Leave blank for no change.

```
OverrideTwsMasterClientID=
```

### Read-only Login

Set to 'yes' to log in automatically in read-only mode, skipping second factor authentication. Default is 'no'.

```
ReadOnlyLogin=no
```

### Read-only API

Set to 'yes' to prevent API programs from submitting, modifying or canceling orders. Default is blank (no change to configuration).

```
ReadOnlyApi=${READ_ONLY_API}
```

### API Precautions

The following settings relate to the 'Precautions' checkboxes in the API configuration. Set to 'yes' to enable the precaution, 'no' to disable, or leave blank for no change.

```
BypassOrderPrecautions=${BYPASS_WARNING}
BypassBondWarning=${BYPASS_WARNING}  
BypassNegativeYieldToWorstConfirmation=${BYPASS_WARNING}
BypassCalledBondWarning=${BYPASS_WARNING}
BypassSameActionPairTradeWarning=${BYPASS_WARNING}  
BypassPriceBasedVolatilityRiskWarning=${BYPASS_WARNING}
BypassUSStocksMarketDataInSharesWarning=${BYPASS_WARNING}
BypassRedirectOrderWarning=${BYPASS_WARNING}
BypassNoOverfillProtectionPrecaution=${BYPASS_WARNING}
```

### Market data size for US stocks - lots or shares

#### AcceptBidAskLastSizeDisplayUpdateNotification

Specifies how to handle the dialog about market data size for US stocks. Allowed values are 'accept', 'defer' and 'ignore' (default).

```  
AcceptBidAskLastSizeDisplayUpdateNotification=accept
```

#### SendMarketDataInLotsForUSstocks

Set to 'yes' to send market data for US stocks in lots for dual-mode API clients, 'no' to send in shares. Leave blank for no change.

```
SendMarketDataInLotsForUSstocks=
```

### Trusted API Client IPs

A comma-separated list of IP addresses for API clients that can connect without generating the 'Incoming connection' popup. Only relevant for Gateway with `FIX=yes`.

```
TrustedTwsApiClientIPs=
```

### Reset Order ID Sequence 

Set to 'yes' or 'true' to reset the API order ID sequence when TWS starts. Default is 'no'.

```
ResetOrderIdsAtStart=
```

### Confirm Order ID Reset

Specifies IBC's action when TWS displays the dialog to confirm resetting the API order ID sequence. See configuration file comments for details.

```
ConfirmOrderIdReset=
```

## 4. TWS Auto-Logoff and Auto-Restart

### AutoLogoffTime

Specifies the time at which TWS will shut down without restarting, in HH:MM AM/PM format (e.g. 08:00 AM).

```
AutoLogoffTime=${AUTO_LOGOFF_TIME} 
```

### AutoRestartTime

Specifies the time at which TWS will shut down and restart, in HH:MM AM/PM format (e.g. 10:00 PM).

```
AutoRestartTime=${AUTO_RESTART_TIME}
```

## 5. TWS Tidy Closedown Time

### ClosedownAt

Specifies a time at which TWS will close down tidily with no restart. Can be a time (HH:MM) for daily closedown or a day and time (DAY HH:MM) for weekly. See configuration file comments for details.

```
ClosedownAt=
```

## 6. Other TWS Settings

### AcceptIncomingConnectionAction

Specifies IBC's action for incoming API connection dialogs. Allowed values are 'accept', 'reject' (recommended), or 'manual' (default).

```
AcceptIncomingConnectionAction=reject
```

### AllowBlindTrading

Set to 'yes' to automatically dismiss the blind trading warning dialog and submit the order. Default is 'no' (dialog must be handled by user).

```
AllowBlindTrading=no
```

### SaveTwsSettingsAt

Schedule for automatically saving TWS settings. Can specify times (HH:MM) and/or intervals. See configuration file comments for details.

```
SaveTwsSettingsAt=${SAVE_TWS_SETTINGS}  
```

### ConfirmCryptoCurrencyOrders

Specifies IBC's action for the dialog to confirm crypto currency orders. Allowed values are 'transmit', 'cancel' or 'manual'.

```
ConfirmCryptoCurrencyOrders=transmit
```

## 7. Settings Specific to Indian Versions of TWS

### DismissPasswordExpiryWarning

Set to 'yes' to automatically dismiss the password expiry notification dialog. Default is 'no'.

```
DismissPasswordExpiryWarning=no
```

### DismissNSEComplianceNotice

Set to 'yes' to automatically dismiss the NSE Compliance dialog. Default is 'yes'.

```
DismissNSEComplianceNotice=yes
```

## 8. IBC Command Server Settings

These settings relate to issuing commands to IBC. Do not change unless you intend to use this functionality. 

### CommandServerPort

The port number for the IBC command server. Default is 0 (command server disabled).

```
CommandServerPort=0
```

### ControlFrom

A comma-separated list of IP addresses or host names allowed to send commands to IBC.

```
ControlFrom=
```

### BindAddress  

The IP address on which the command server listens. Default is all local addresses.

```
BindAddress=
```

### CommandPrompt

A string to output as the command prompt. Default is no prompt.

```
CommandPrompt=  
```

### SuppressInfoMessages

Set to 'yes' to suppress intermediate progress information from commands. Default is 'yes'.

```
SuppressInfoMessages=yes
```

## 9. Diagnostic Settings

These settings control logging of TWS window structure for diagnostics.

### LogStructureScope 

Specifies which windows are eligible for structure logging. Allowed values are 'known' (default), 'unknown', 'untitled', or 'all'.

```
LogStructureScope=known
```

### LogStructureWhen

Specifies when eligible windows have their structure logged. Allowed values are 'open', 'openclose', 'activate', or 'never' (default).

```
LogStructureWhen=never
```

### LogComponents (DEPRECATED)

THIS SETTING WILL BE REMOVED IN A FUTURE RELEASE. Any value overrides `LogStructureWhen` and `LogStructureScope`.

```
#LogComponents=
```