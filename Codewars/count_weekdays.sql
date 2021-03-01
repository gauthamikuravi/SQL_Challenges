--You need to create a function that calculates the number of weekdays (Monday through Friday) between two dates inclusively.

--The function should be named weekdays accept two arguments of type DATE and return an INTEGER value.

--weekdays(DATE, DATE) INTEGER
--The order of arguments shouldn't matter. To illustrate both of the following queries

--SELECT weekdays('2016-01-01', '2016-01-10');



create or replace function weekdays(_start date, _finish date) 
returns integer
as
$$

  select count(*) filter (where extract(dow from g.d) between 1 and 5)::int as weekdays
  from generate_series(least(_start, _finish), greatest(_start, _finish), interval '1 day') as g(d);

$$ language sql;
