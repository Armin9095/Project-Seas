extends Resource
class_name GoodDefinition

# Il nome visibile, prezzo base e icona
@export var name: String = "Good"
@export var icon: Texture2D

# Il prezzo di riferimento
@export var base_price: int = 10

# Spazio occupato 
@export var weight: float = 1.0

enum GoodType { 
	RAW_MATERIAL, # Cibo essenziale (Grano, Pesce)
	FOOD,         #  Materie prime (Legno, Ferro)
	LUXURY_GOOD,   # Beni di lusso (Spezie, Vestiti)
	CONSUMER_GOOD, # Beni di consumo 
	MILITARY_GOOD,
}
