alter PROCEDURE [dbo].[spCreateUserIncomeWallet]
@userid nvarchar(450),
@walletAddress nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO IncomeWallets (UserId, WalletAddress, CurrencyAcronim, Value)
VALUES (@userid, @walletAddress, @currencyAcronim, 0)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id


--insert wallet if not exist
If Not Exists(SELECT 1 FROM Wallets WHERE UserId = @userid AND CurrencyAcronim = @currencyAcronim)
Begin
INSERT INTO Wallets (UserId, CurrencyAcronim, Value)
VALUES (@userid, @currencyAcronim, 0)
End

RETURN

END