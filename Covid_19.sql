--1) Datewise Likelihood of dying Totalcases vs TotalDeath in India
SELECT date, total_cases, total_deaths from "covidDeaths"
where location like '%India%'

  
--2) Total % of deaths out of entire population in India
SELECT max(total_deaths)/avg(cast(population as integer))*100 from "covidDeaths"
where location like '%India%'

  
--3) Country with highest death as a % of population
select location,(cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage from "covidDeaths" 
group by location 
order by percentage desc;


--4) Total % of covid +ve cases in India
SELECT (max(total_cases)/avg(cast(population as bigint))*100) as percentagepositive from "covidDeaths"
where location like '%India%'

  
--5) Total % of covid +ve cases in world
SELECT location, (max(total_cases)/avg(cast(population as bigint))*100) as percentagepositive from "covidDeaths"
group by location
order by percentagepositive desc

  
--6) Continentwise +ve cases.
SELECT location, max(total_cases) as total_cases from "covidDeaths"
where continent is null
group by location
order by total_cases desc

  
--7) Continentwise deaths
SELECT location, max(total_deaths) as total_deaths from "covidDeaths"
where continent is null
group by location
order by total_deaths desc

  
--8) Daily newcases vs hospitalizations vs icu_patients India
SELECT date, new_cases, hosp_patients, icu_patients from "covidDeaths" 
where location like '%India%'

  
--9) countrywise age>65
SELECT "covidDeaths".date,"covidDeaths".location,"covidVaccination".aged_65_older from "covidDeaths" 
join "covidVaccination" on "covidDeaths".iso_code="covidVaccination".iso_code and "covidDeaths".date="covidVaccination".date


--10) Countrywise total vaccinated persons.
select "covidDeaths".location as country,max("covidVaccination".people_fully_vaccinated) as Fully_vaccinated from "covidDeaths" 
join "covidVaccination" on "covidDeaths".iso_code="covidVaccination".iso_code and "covidDeaths".date="covidVaccination".date where "covidDeaths".continent is not null group by country order by Fully_vaccinated desc;

