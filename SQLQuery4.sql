
--Expected Answer key: https://gist.github.com/AdamSheaffer/8dda90933e63c35bb7dbf585fc7dee71

-- What grades are stored in the database?
select * from Grade;

-- What emotions may be associated with a poem?
select * from Emotion;

--How many poems are in the database?
select count(id) from poem;

-- Sort authors alphabetically by name. What are the names of the top 76 authors?
select top 76 name from Author
order by name;

--Starting with the above query, add the grade of each of the authors.
select top 76 a.name, g.Name 
from Author a
join Grade g on a.GradeId = g.id
order by a.name;

-- Starting with the above query, add the recorded gender of each of the authors.
select top 76 a.name studentName, g.Name grade, gen.Name gender
from Author a
join Grade g on a.GradeId = g.id
join Gender gen on gen.id = a.GenderId
order by a.name;

-- What is the total number of words in all poems in the database?
select sum(wordcount) "Total Word Count"
from poem;

-- Which poem has the fewest characters?
select top 1 title, CharCount
from poem
order by CharCount;

-- How many authors are in the third grade?
select count(Author.id) 'total 3rd graders'
from Author
join Grade on Author.GradeId = Grade.id
where grade.Name = '3rd grade';

-- How many total authors are in the 1st through 3rd grades?
select count(Author.id) 'total 1st through 3rd graders'
from Author
join Grade on Author.GradeId = Grade.id
where grade.Name = '1st grade' 
or grade.name = '2nd grade' 
or grade.name = '3rd grade';

-- What is the total number of poems written by fourth graders?
select count(p.id) 'total 4th grade poems'
from Poem p
join Author a on a.Id = p.Authorid
join Grade g on a.GradeId = g.id
where g.Name = '4th grade';

-- How many poems are there per grade?
select count(p.id) 'total poems', g.name
from poem p
join Author a on a.Id = p.Authorid
join Grade g on a.GradeId = g.id
group by g.Name;

-- How many authors are in each grade? (Order your results by grade starting with 1st Grade)
select count(a.id) 'total authors', g.name
from Author a
join Grade g on a.GradeId = g.id
group by g.Name;

-- What is the title of the poem that has the most words?
select top 1 p.title 'poem with most words', p.wordcount
from poem p
order by p.wordcount desc;

-- This one messed with my head!
-- Which author(s) have the most poems? (Remember authors can have the same name.)
select top 5 count(p.AuthorId) 'poems by author', a.Name
from Poem p
join author	a on p.AuthorId = a.id
group by p.AuthorId, a.Name
order by 'poems by author' desc;

-- How many poems have an emotion of sadness? 
select count(pe.Id) 'total sad poems'
from PoemEmotion pe
join Emotion e on pe.EmotionId = e.id
where e.Name = 'sadness';

-- How many poems are not associated with any emotion? ( = does not equal 'is'!)
select count(*) 'emotionless poems'
from Poem p
left join PoemEmotion pe on p.id = pe.PoemId
where pe.id is NULL;

-- Which emotion is associated with the least number of poems? ( Anger )
select top 1 count(pe.emotionId) 'emotion count', e.Name 'emotion cited the least'
from PoemEmotion pe
join Emotion e on pe.EmotionId = e.id
group by pe.EmotionId, e.Name
order by 'emotion count';

-- Which grade has the largest number of poems with an emotion of joy?
--select all the poems with emotions, only ones with "joy" as the emotion, then group them by grade, so we can count the poemsby grade
select top 1 count(pe.id) 'happy poems', g.Name
from PoemEmotion pe
join Emotion e on pe.EmotionId = e.id
join Poem p on pe.PoemId = p.id
join Author a on a.id = p.AuthorId
join Grade g on g.id = a.GradeId
where e.Name = 'joy'
group by g.Name
order by 'happy poems' desc;

-- Which gender has the least number of poems with an emotion of fear?
select count(pe.id) 'fearful poems', g.Name
from PoemEmotion pe
join Emotion e on pe.EmotionId = e.id
join Poem p on pe.PoemId = p.id
join Author a on a.id = p.AuthorId
join Gender g on g.id = a.GenderId
where e.Name = 'fear'
group by g.Name
order by 'fearful poems';

--Which emotion is associated with the least number of poems?
--Which grade has the largest number of poems with an emotion of joy?
--Which gender has the least number of poems with an emotion of fear?
select top 76 a.*, g.Name
from Author a
join Grade g on g.id = a.GradeId
order by a.Name;