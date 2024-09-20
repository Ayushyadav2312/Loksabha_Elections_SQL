-- Total Seats 

select distinct count (parliament_constituency) as Total_seats
from constituencywise_results;

--> 543

--Total no. of seats in each state

select s.State,  count(cr.Parliament_Constituency) as No_of_seats
from states s
join statewise_results sr on s.State_ID = sr.State_ID
join constituencywise_results cr on sr.Parliament_Constituency = cr.Parliament_Constituency
group by s.State;


-- Total seats won by NDA Alliance

select sum(case
				when party in ( 'Bharatiya Janata Party - BJP',
								'Telugu Desam - TDP',
								'Shiv Sena - SHS',
								'Janata Dal  (United) - JD(U)',
								'AJSU Party - AJSUP',
								'Apna Dal (Soneylal) - ADAL',
								'Asom Gana Parishad - AGP',
								'Hindustani Awam Morcha (Secular) - HAMS',
								'Janata Dal  (Secular) - JD(S)',
								'Janasena Party - JnP',
								'Nationalist Congress Party - NCP',
								'Lok Janshakti Party(Ram Vilas) - LJPRV',
								'Rashtriya Lok Dal - RLD',
								'Sikkim Krantikari Morcha - SKM')
								then [won]
								else 0 
								end) as Seats_won_by_NDA_Alliance

from partywise_results;
								

-- Seats won by each NDA Alliance party


select party,won
from partywise_results
where party in ( 'Bharatiya Janata Party - BJP',
								'Telugu Desam - TDP',
								'Shiv Sena - SHS',
								'Janata Dal  (United) - JD(U)',
								'AJSU Party - AJSUP',
								'Apna Dal (Soneylal) - ADAL',
								'Asom Gana Parishad - AGP',
								'Hindustani Awam Morcha (Secular) - HAMS',
								'Janata Dal  (Secular) - JD(S)',
								'Janasena Party - JnP',
								'Nationalist Congress Party - NCP',
								'Lok Janshakti Party(Ram Vilas) - LJPRV',
								'Rashtriya Lok Dal - RLD',
								'Sikkim Krantikari Morcha - SKM')
group by party
order by won desc;


--Total seats won by I.N.D.I.A Alliance

select
sum (case
when party in (
'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Nat`Jammu & Kashmir National Conference - JKN',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK'
) then [Won]
Else 0
End ) as INDIA_Total_Seats_Won
from
    partywise_results ;

-- Seats won by each I.N.D.I.A Alliance party


select party, won
from partywise_results
where party in (
				'Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
				'Communist Party of India - CPI',
				'Dravida Munnetra Kazhagam - DMK',
				'Indian Union Muslim League - IUML',
				'Nat`Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Jammu & Kashmir National Conference - JKN',
				'Kerala Congress - KEC',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Rashtriya Janata Dal - RJD',
				'Rashtriya Loktantrik Party - RLTP',
				'Revolutionary Socialist Party - RSP',
				'Samajwadi Party - SP',
				'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
				'Viduthalai Chiruthaigal Katchi - VCK')  


order by won;


-- Add a column in partywise_result table to find NDA and I.N.D.I.A Alliance

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


select * from partywise_results;

-- Seats won by Alliances

select party_alliance, sum(won) as seats_won_by_alliances 
from partywise_results
group by party_alliance ;


--Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

select cr.winning_candidate, pr.party, cr.total_votes, cr.margin, s.state, constituency
from constituencywise_results cr
join partywise_results pr on pr.Party_ID = cr.Party_ID
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
join states s on sr.State_ID= s.State_ID ;



--what is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
from
    constituencywise_details cd
JOIN 
    constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID;

--Which parties won the most seats in a State, and how many seats did each party win?

select
    p.Party,
    count(cr.Constituency_ID) as Seats_Won
from
    constituencywise_results cr
join 
    partywise_results p on cr.Party_ID = p.Party_ID
join 
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join states s on sr.State_ID = s.State_ID
where 
    s.state = 'Uttar Pradesh'
group by 
    p.Party
order by 
    Seats_Won desc;

--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select
    s.State AS State_Name,
    sum(case when p.party_alliance = 'NDA' then 1 else 0 end) as NDA_Seats_Won,
    sum(case when p.party_alliance = 'I.N.D.I.A' then 1 else 0 end) as INDIA_Seats_Won,
	sum(case when p.party_alliance = 'OTHER' then 1 else 0 end) as OTHER_Seats_Won
from
    constituencywise_results cr
join 
    partywise_results p on cr.Party_ID = p.Party_ID
join 
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join
    states s on sr.State_ID = s.State_ID
where
    p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
group by
    s.State
order by
    s.State;


--Which candidate received the highest number of EVM votes in each constituency (Top 10)?


	select top 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
from
    constituencywise_details cd
join
    constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
where 
    cd.EVM_Votes = (
        select max(cd1.EVM_Votes)
        from constituencywise_details cd1
        where cd1.Constituency_ID = cd.Constituency_ID
    )
order by
    cd.EVM_Votes desc;



--Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

with RankedCandidates as (
    select
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes as Total_Votes,
        ROW_NUMBER() over (partition by cd.Constituency_ID order by cd.EVM_Votes + cd.Postal_Votes desc) as VoteRank
    from 
        constituencywise_details cd
    join
        constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
    join
        statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
    join
        states s on sr.State_ID = s.State_ID
    where 
        s.State = 'Maharashtra'
)

select
    cr.Constituency_Name,
    max(case when rc.VoteRank = 1 then rc.Candidate end) as Winning_Candidate,
    max(case when rc.VoteRank = 2 then rc.Candidate end) as Runnerup_Candidate
from
    RankedCandidates rc
join 
    constituencywise_results cr on rc.Constituency_ID = cr.Constituency_ID
group by
    cr.Constituency_Name
order by 
    cr.Constituency_Name;
