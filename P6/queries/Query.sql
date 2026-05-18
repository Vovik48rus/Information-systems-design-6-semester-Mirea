select M.name
from "User"
join "ModelMetadata" MM ON MM.author_id = "User".id
join "3D Model" M ON M.id = MM.model_id
where "User".name = 'Петр Петров'
