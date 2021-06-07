SELECT DISTINCT r.id, r.name,
count(t.id) OVER(
PARTITION BY r.id ORDER BY r.name) "number_of_towns"
FROM regions r
JOIN departments d ON r.code = d.region
JOIN towns t ON d.code = t.department
ORDER BY r.id;