# When Fragmentation Meets Institutions: Party System Fragmentation and Government Formation in European Parliamentary Democracies

## Introduction

The formation of governments in parliamentary democracies is one of the most consequential moments in democratic politics. Yet the process by which elections translate into governing coalitions varies enormously across countries and over time. In some cases, a government is sworn in within days of an election; in others, negotiations can last weeks or even months. What explains this variation?

One prominent candidate is party system fragmentation. As the number of effective parties in a legislature increases, the combinatorial complexity of coalition bargaining grows, potentially making government formation slower. Europe has witnessed a sustained increase in party fragmentation since the 1980s, making this question increasingly relevant.

This paper examines the relationship between party system fragmentation, measured by the Effective Number of Parties (ENP), and government formation duration across 14 European parliamentary democracies from 1970 to 2024. We find that the relationship between fragmentation and formation duration is primarily structural and cross-national rather than dynamic and within-country. These findings suggest that the effect of fragmentation on government formation is conditional on institutional context, and that cross-national differences in coalition norms and governance culture likely play a central role.

## Theory

Party system fragmentation complicates government formation through a straightforward mechanism: as the number of parties in parliament increases, the set of feasible coalition combinations expands, and the bargaining problem becomes correspondingly more complex. Forming a majority coalition requires identifying a set of parties whose combined seat share crosses the threshold for parliamentary confidence, negotiating portfolio allocations, and reaching agreement on a policy program. Each additional party in the legislature adds potential veto players and increases the dimensionality of the bargaining space, raising the expected time to reach a stable agreement.

This logic suggests a positive relationship between the Effective Number of Parties (ENP) and government formation duration. However, the relationship may be conditional on features of the political system that shape how fragmentation translates into bargaining complexity. Two factors are particularly relevant. First, the size of the largest party matters: when a single party commands a large seat share, it can serve as a natural coalition anchor, reducing the number of feasible coalitions and simplifying negotiations. Second, established coalition norms and governance cultures may allow political actors to navigate fragmented legislatures efficiently. Denmark, for instance, has long maintained a tradition of minority governments that operate with external parliamentary support, effectively decoupling fragmentation from the need for extensive coalition negotiations.

These considerations suggest that the relationship between fragmentation and formation duration may depend on stable institutional features of political systems, rather than purely on short-term fluctuations in party system structure.

## Data

This study draws on the ParlGov dataset, a comprehensive source of comparative data on elections, parties, and cabinets in parliamentary democracies. The sample covers 14 European countries with proportional or mixed-member electoral systems: Austria, Belgium, Denmark, Finland, Germany, Greece, Iceland, Ireland, Italy, the Netherlands, Norway, Portugal, Spain, and Sweden. The time period spans from 1970 to 2024. The unit of observation is a country-election, yielding 214 observations with complete data on all key variables.

The dependent variable is government formation duration, defined as the number of days between the election date and the swearing-in of the first non-caretaker government. Because the raw distribution is highly right-skewed, with a median of 32 days and a maximum of 541 days (Belgium, 2010–2011), the primary analyses use the natural logarithm of (days + 1). Cases where a government was formed on the day of the election are retained and coded as zero prior to transformation, as these cases plausibly represent elections with unambiguous outcomes rather than data errors.

The key independent variable is the Effective Number of Parties (ENP), calculated from legislative seat shares using the standard Laakso-Taagepera formula: ENP = 1 / Σ(p_i²), where p_i is the seat share of party i. ENP in our sample ranges from 1.7 to 10.1, with a median of 4.1. The principal control variable is the largest party seat share, which captures the degree to which one party dominates the legislature and is expected to negatively predict formation duration. A linear year trend is included to control for broader temporal changes in European political systems.

The following section describes the empirical specification used to examine these relationships. To examine the relationship between party fragmentation and government formation duration, we estimate a series of OLS regression models with log(days + 1) as the dependent variable. We begin with a baseline model regressing formation duration on ENP alone, before adding controls for largest party seat share and a linear year trend. Our preferred specification additionally includes country fixed effects, which absorb all time-invariant country-level characteristics and restrict identification to within-country variation over time. In this specification, standard errors are clustered at the country level to account for within-country serial correlation. We supplement the main analysis with two robustness checks using alternative dependent variables: raw formation duration and the seat rank of the prime ministerial party.

## Results

### Descriptive patterns

Figure 1 shows the evolution of party system fragmentation across the 14 sample countries from 1970 to 2024. While there is substantial cross-national variation in baseline ENP levels, the overall trend is one of increasing fragmentation, particularly from the 1980s onward. Notable exceptions include Italy, where ENP rose sharply through the early 1990s before declining following the collapse of the First Republic in 1994, and Portugal, which has maintained relatively low and stable fragmentation throughout the period.

Figure 2 shows the distribution of government formation duration. The raw distribution is highly right-skewed, with most governments formed within 40 days but a long tail of protracted negotiations. Figure 3 plots ENP against log formation duration and reveals a positive association: elections in more fragmented party systems tend to be followed by longer government formation processes. Figure 4 documents substantial cross-national variation in formation duration, with Belgium and the Netherlands recording the highest median durations and Greece the lowest.

### Regression results

Table 1 presents the main regression results. Model 1, a simple OLS regression of log formation duration on ENP, yields a positive and statistically significant coefficient (β = 0.24, p < 0.001), consistent with the theoretical expectation that more fragmented systems tend to experience longer formation processes.

Model 2 adds the largest party seat share and a year trend. The ENP coefficient reverses sign and becomes negative (β = −0.28, p < 0.05), while the largest party seat share is strongly negative and significant (β = −8.62, p < 0.001). This reversal reflects the strong correlation between ENP and largest party seat share: more fragmented systems tend to have smaller dominant parties, and once this is accounted for, the raw positive association between ENP and formation duration is no longer apparent. These variables capture overlapping dimensions of party system structure, and the sign reversal should be interpreted with caution rather than as evidence that fragmentation reduces formation duration.

Model 3 introduces country fixed effects with clustered standard errors. The ENP coefficient becomes small and statistically indistinguishable from zero (β = 0.09, p > 0.1), while the overall R² is 0.50 but the within-country R² is only 0.057. This pattern indicates that the bulk of the explained variance reflects stable cross-national differences rather than within-country dynamics. In other words, while countries with persistently higher fragmentation tend to take longer to form governments, increases in fragmentation within a given country are not systematically associated with longer formation processes.

### Robustness checks

Two robustness checks support a qualified interpretation of these findings. First, replacing the log-transformed dependent variable with raw formation duration yields a significant positive ENP coefficient in the fixed effects model (β = 19.0, p < 0.05), suggesting that the relationship between fragmentation and formation duration becomes more visible when the raw duration measure gives greater weight to longer formation episodes. Second, using the seat rank of the prime ministerial party as an alternative outcome, we find a positive but only marginally significant ENP coefficient (β = 0.17, p < 0.1), consistent with the expectation that more fragmented systems are somewhat more likely to produce governments led by parties other than the largest. A negative and significant year trend in this model (β = −0.015, p < 0.05) offers suggestive evidence that prime ministerial parties have tended to come from larger parties over time, though this finding should be interpreted cautiously given the ordinal nature of the outcome variable.

## Discussion

This paper set out to examine whether party system fragmentation increases government formation duration in European parliamentary democracies. The theoretical argument proposed that fragmentation increases bargaining complexity during coalition formation. The results tell a nuanced story. At the cross-national level, fragmentation is associated with longer formation processes, and this pattern is visible in both the descriptive data and the baseline regression. However, once country fixed effects are introduced, the within-country relationship between changes in ENP and changes in formation duration is weak and statistically insignificant. The dominant share of explained variance is attributable to stable country-level characteristics rather than to dynamic fluctuations in fragmentation.

Two country cases illustrate how institutional context conditions this relationship. Denmark presents a striking case: despite consistently high ENP scores, it records some of the shortest formation durations in the sample. Denmark's long-standing tradition of minority governments, which govern with external parliamentary support rather than formal coalition partners, effectively insulates the formation process from the bargaining complexity that fragmentation might otherwise generate. This suggests that political norms and coalition practices can substantially buffer the effects of fragmentation on governability. Italy offers a contrasting illustration of structural discontinuity: ENP rose sharply through the early 1990s, collapsed following the dissolution of the First Republic in 1994, and has risen again since the mid-2010s. Such non-linear trajectories are partially absorbed by country fixed effects, highlighting the limits of capturing party system transformations through a single continuous indicator such as ENP.

Taken together, these patterns suggest that fragmentation should not be interpreted as a mechanical determinant of government formation duration. Instead, its effects appear to be mediated by institutional context and political practice. In systems where coalition bargaining follows well-established norms — such as the routine formation of minority governments or predictable coalition blocs — high levels of party fragmentation need not translate into prolonged negotiations. Conversely, where party systems undergo structural disruption or lack stable coalition conventions, similar levels of fragmentation may generate much greater uncertainty in the formation process. This perspective helps reconcile the mixed empirical findings in the existing literature on fragmentation and governability.

Several limitations of this study should be noted. First, the analysis omits ideological polarization, which may independently affect coalition bargaining complexity and is correlated with fragmentation in some contexts. Second, approximately 100 elections in the sample could not be matched to a non-caretaker government formation date in the ParlGov data, and these missing cases are not randomly distributed across countries. Third, the relatively small number of countries limits the precision of clustered standard errors and the generalizability of country-level conclusions.

Future research could extend this framework in several directions. Incorporating ideological distance between potential coalition partners would allow a more direct test of the bargaining mechanism hypothesized in the theory section. Distinguishing between majority and minority government formations would help isolate the specific pathway through which fragmentation affects duration. More broadly, the finding that formation duration is largely explained by country-level fixed factors raises the question of what those factors are — coalition culture, constitutional rules, or patterns of inter-party trust — and how they interact with fragmentation over time.

## Conclusion

This paper examined whether party system fragmentation increases government formation duration in European parliamentary democracies. While more fragmented party systems are associated with longer formation processes in cross-national comparisons, the relationship largely disappears once stable country-level characteristics are taken into account. These findings suggest that fragmentation alone is an incomplete predictor of governability: its consequences depend on institutional context, coalition practices, and patterns of political coordination. Understanding government formation therefore requires attention not only to the number of parties in parliament, but also to the institutional and normative environments in which coalition bargaining takes place.

## References

Diermeier, D., & van Roozendaal, P. (1998). The duration of cabinet formation processes in western multi-party democracies. *British Journal of Political Science*, 28(4), 609-626.

Doring, H., & Manow, P. (2024). *ParlGov: Parliaments and governments database.* Version 2024. Available at: http://www.parlgov.org

Laakso, M., & Taagepera, R. (1979). Effective number of parties: A measure with application to West Europe. *Comparative Political Studies*, 12(1), 3-27.

Laver, M., & Schofield, N. (1990). *Multiparty Government: The Politics of Coalition in Europe.* Oxford University Press.

Strom, K. (1990). *Minority Government and Majority Rule.* Cambridge University Press.

