# Bachelor Thesis
The subject of the thesis is the examination of the liquidity risk premium in the U.S. capital market over the period 1920 to 2020. Liquidity risk is analyzed using the Ľuboš Pástor and Robert F. Stambaugh liquidity gamma index, with numerous model modifications and their empirical implications. The statistical significance of the calculated liquidity risk premium is affected by the data basis, the data frequency and filtering techniques with regard to the monthly share price. In addition, the time point and the frequency of portfolio rebalancing also show statistical effects that represent robustness tests for the risk premium. The statistical significance of the calculated liquidity risk premium varies across different sub-periods, but can generally be shown to be robust. Analyses of different data frequencies and version controls of the used database may offer further future insight for replication studies and empirical proves.

The thesis was finally graded 1.3 in the german grade ranking system which is equivalent to a 3.7 GPA.

The main paper from Ľuboš Pástor and Robert F. Stambaugh describing the method can be found [here](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=279804). 

# The procedure and thesis in short
The focus of this paper is to analyse whether liquidity risk itself, and under what con- ditions, can be empirically proven to be a systematic risk factor in US capital market returns. It is shown whether a conceptualised liquidity risk factor should be consid- ered in future multifactor models to explain stock returns. The relationship between stock price and measurement concept to aggregate total market liquidity is analysed in more detail.

Definition of liquidity
Since the concept of liquidity depends on the application in various ways and is therefore first defined more precisely in order to be able to refer to it in the further course of the work.
A distinction is made between three main types of liquidity:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/OverviewLiquidity.png" 
       width=800"/>
</p>

Market liquidity is understood as the ability to trade large volumes quickly, at low cost and without price movements in the market. Depending on the market environment, there are shifts in the relevance of characterising properties of liquidity. All characterising parameters are time-variable. In times of high financial market stability, transaction costs appear to be highly relevant, whereas in times of crisis rapid equilibrium price discovery through the mapping of new information appears to be the main feature.
Market liquidity, as one of the main types of liquidity mentioned above, which is the subject of this analysis, is characterised by three main features:
- Price stability ("without price movements")
- Immediate order execution ("fast")
- Order size ("large volumes")

In order to enable a better assessability of these characteristics, they are formulated as components of transaction costs.31 Market liquidity can be understood as the trad- ing cost of a securities transaction in the capital market, relative to its fair value. 
Total transaction costs comprise four components: The price effect PI(q), the search costs S(q), the delay costs D(q) and the direct trade costs TC(q).
In sum, the com- ponents represent the market liquidity of a security as follows:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/EquationTransactionCosts.png" 
       width=400"/>
</p>

In this thesis the price effect or impact is stressed.
The price effect PI(q) measures how strongly a transaction entered into the market influences the current market price of the security in question. Accordingly, price effect costs can be understood as the difference between the realised transaction price and the fair value. The price effect includes the premium or discount the trader pays to execute his transaction at the current market conditions. The price effect component can be divided into a short-term and a long-term effect. In the short term, the transaction creates an imbalance between supply and demand, to which the price adjusts. This effect results from the lack of market liquidity and usually has no significant impact on the fundamental value of the security. Accordingly, a rapid recovery to the level of the fair value takes place again after the order has been settled (reversal). The long-term effect, on the other hand, results from the traders' informational interpretation of the transactions. Transactions may have been triggered by traders who possess superior information, which represents a potential risk for the securities traders, against which they hedge in part with a constant price reflection, which is ultimately reflected in the market as part of the price effect.

Only considering the bid-ask spread as liquidity measure wouldnt be enough.
The difference between the bid and ask price cannot fully capture the facet of the price effect, as the market depth is not taken into account:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/BidAskSpread.png" 
       width=800"/>
</p>

This capture is also not possible through purely volume-based characteristics, such as trading volume. In the following, market liquidity is operationalised on the various market liquidity dimensions in order to ensure a better quantitative assessment of the measurement concepts.
# Liquidity in the orderbook
The depth of a market is determined by the presence of both limited buy and sell orders that can be executed at a price close to the market price. he depth dimension here refers to the definition aspect of price stability. A market has breadth if, on the one hand, orders are available in large numbers, there are many suppliers and demanders, and, on the other hand, if they are available in a corresponding volume. The renewal power of a market is understood as the process when short-term price changes, caused by temporary order imbalances, are immediately offset by new orders flowing into the market.The renewal power is necessary to ensure trading on financial markets at all times and thus represents the basis for the dimensions depth and breadth. The time dimension describes the speed with which an order of a given size can be executed in the market at applicable costs. The time dimension represents the definition aspect of immediate execution.

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/OrderBook.png" 
       width=600"/>
</p>

All four dimensions together fully represent market liquidity. Measurement concepts that are to measure market liquidity must be able to depict it sufficiently. Structural components of the market set-up, such as market organisation forms and market microstructures, which have a significant influence on the interaction of the four di- mensions, will not be discussed further due to the focus of the paper.

# Delineation of the concept of risk: liquidity - characteristics, risk factor and premium
On the capital market, a distinction is made between systematic and unsystematic, i.e. idiosyncratic, risk according to CAPM considerations.
The systematic part is accounted for by the sensitivity of equity returns to the returns of the broad market, which is modelled in the beta factor as a linear covariance relationship. 
The expected return on shares is based on this systematic risk, as the relationship of the equations shows:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/CAPMandBeta.png" 
       width=200"/>
</p>

where 𝐸[𝑅i] is the expected stock return, 𝛾0 is the return on an assumed risk-free investment and 𝛾1 is the excess market return 𝛾1 = (𝑅0 − 𝛾0).
The liquidity risk of a security is based on the variation of its price over time in response to unexpected changes in aggregate total market liquidity and therefore can be futher divided:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/MarkeLiquidity.png" 
       width=600"/>
</p>

In this paper, we refer to the linear relationship between aggregate market liquidity and stock returns in the context of systematic risk, which corresponds to the middle aspect of the "liquidity betas in the multifactor model" branch in the figure above.

# Constructing the liquidity gamma index according to Pástor and Stambaugh

1) Liquidity measurement at company level
The liquidity ratio for share 𝑖 in the month 𝑡 is the Ordinary Least Squares (OLS) estimator of the regression coefficient 𝛾i,t of the regression equation:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/ReturnRegression.png" 
       width=600"/>
</p>

With the parameters 𝑟 i,d,t as the excess return 𝑟e, i,d,t = 𝑟 i,d,t − 𝑟 m,d,t of the realized return 𝑟 i,d,t over the value-weighted CRSP Market return 
𝑟 m,d,t at the day 𝑑 in the month t; 𝜐 i,d,t as the trading volume of the stock 𝑖 at the day 𝑑 in the month 𝑡, 𝑠𝑖𝑔𝑛(𝑟e, i,d,t) takes on the following values:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/SignVolume.png" 
       width=300"/>
</p>

2) Liquidity measurement at overall market level
From the share-specific liquidity measures, in total 𝑁 each month 𝑡, the total market level is aggregated to by taking the simple average:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/AverageGamma.png" 
       width=150"/>
</p>

Adjusting the measure for inflation:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/InflationAdjusting.png" 
       width=80"/>
</p>

with the parameter 𝑚t, as the market value of all in the month 𝑡 in the average included stocks 𝑖 at the end of the month 𝑡 − 1 in USD and 𝑚1, as the corresponding market value in the first month of the data basis, i.e. here August 1962.

In order to calculate the changes (innovations) in the total market liquidity time series, we proceed as follows:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/DeltaOfGamma.png" 
       width=250"/>
</p>

The computed delat △ 𝛾t is regressed on its previous value △ 𝛾t-1 and on the previous value of the scaled time series (𝑚t/𝑚1)*𝛾t-1:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/Delta.png" 
       width=250"/>
</p>

These residuals, scaled by 100 𝑢t, form the time series of changes in total market liquidity (innovations in liquidity) 𝐿1:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/LiquidityIndex.png" 
       width=110"/>
</p>

# Interpretation of the Liquidity Gamma Index
The value of the regression coefficient 𝛾i,t can be interpreted as the cost of liquidity, t. m. as a return reversal, which accrues when USD 1 million of share 𝑖 will be traded. In terms of the overall market ratio, this is what it would cost if each share in the market traded for $1 million in transaction volume.

# Portfolio formation and measuring alpha 
Equity return sensitivity, in relation to changes in overall market liquidity 𝐿1 , is comparable to a regression coefficient, t. m. as the liquidity beta 𝛽 L,i, in a multiple regression model with additional variables identified as explanatory components of stock returns.
For this purpose, at the end of each year, starting in 1967, 10 portfolios (decile portfolios) are formed by PS, based on the values of 𝛽 L,i.

The recalculated returns of the following 12 months of these portfolio constellations are recorded per portfolio as a time series up to the year 1999. The resulting excess returns of these portfolio constellations are regressed on recognised variables explaining the stock returns. If the intercepts
𝛽 0,i, also referred to as alpha (𝛼), are different from zero, the liquidity beta 𝛽 L,i explains risk components of equity returns that cannot be explained by previously known risk factors. For portfolio sorting purposes, the liquidity beta 𝛽 L,i is calculated according to the following multiple regression equation for each share of the data base:

<p align="center">
  <img src="https://github.com/RobertHennings/BachelorThesis/blob/main/Figures/SortingRegression.png" 
       width=600"/>
</p>

With the parameters 𝑟 as the excess return oft he stock 𝑖, 𝑀𝐾𝑇 (Market) as the excess return above the market index, 𝑆𝑀𝐵 (Small minus Big) and 𝐻𝑀𝐿 (High minus Low) as the excess return between sorted portfolios based on market capitalisation and the book to market value ratio.





