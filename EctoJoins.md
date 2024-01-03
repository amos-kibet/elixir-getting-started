## Ecto Joins

- Joins allow us to combine rows from two or more tables.
- For you to display order details with corresponding customer names, you have to combine rows from both orders and customers tables.

### Inner join

- If you think of two databases as sets, an inner join can be thought of as the interesection of those two sets - it only returns those records which have been successfully joined and therefore exist in both tables.

![inner_join image](https://www.pompecki.com/assets/img/venn_intersection.svg)

### Left join

- We said that an inner join includes only those records which have been successfully joined, any records which don't match the on clause are ignored. A left join is different - it will always include the first database table (i.e. the left one), even if the other table doesn't have a corresponding row.

![left_join image](https://www.pompecki.com/assets/img/venn_left.svg)

### Right join

- A right join is essentially a left join reversed - it is the records from the second (right) table that always make it into the final result, even if they don't have corresponding records in the first table.

![right_join image](https://www.pompecki.com/assets/img/venn_right.svg)

### Full join

- A full join is a combination of a left join and a right join, it includes all records regardless of whether they have a matching row in the other table or not. Imagine we want to find all table entries that don't have a matching row, regardless of which table they come from.

![full_join image](https://www.pompecki.com/assets/img/venn_full.svg)

### Cross join

- Also know as _cartesian product_.
- A cross join combines each row from table A with each row from table B returning all possible combinations (which we can then naturally filter with where clauses).
- The essential thing to remember about the cross join is that it returns all possible combinations of rows from the two tables.

**Reference:**

1. https://www.pompecki.com/post/sql-joins-with-ecto/
