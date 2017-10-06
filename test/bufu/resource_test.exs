defmodule BufuTest.Resource do
  use ExUnit.Case
  use ExVCR.Mock
  import TestHelpers.ResourceHelper

  test_resource Bufu.Accessory, id: 1, name: "DualShock Controller"
  test_resource Bufu.Character, id: 6115, name: "Chie Satonaka"
  test_resource Bufu.Chat, id: 633, title: "EVO 2016 Las Vegas!"
  test_resource Bufu.Company, id: 442, name: "Atlus Co., Ltd."
  test_resource Bufu.Concept, id: 904, name: "Fog"
  test_resource Bufu.Franchise, id: 2830, name: "Persona 4"
  test_resource Bufu.Game, id: 21373, name: "Shin Megami Tensei: Persona 4"
  test_resource Bufu.GameRating, id: 33, name: "CERO: B"
  test_resource Bufu.Genre, id: 5, name: "Role-Playing"
  test_resource Bufu.Location, id: 1837, name: "Inaba"
  test_resource Bufu.Object, id: 3521, name: "Steak"
  test_resource Bufu.Person, id: 89612, name: "Shoji Meguro"
  test_resource Bufu.Platform, id: 19, name: "PlayStation 2"
  test_resource Bufu.Promo, id: 11835, name: "Unprofessional Fridays: 07/15/2016"
  test_resource Bufu.RatingBoard, id: 3, name: "CERO"
  test_resource Bufu.Release, id: 75693, name: "Persona 4"
  test_resource Bufu.Review, id: 511, score: 4
  test_resource Bufu.Theme, id: 13, name: "Crime"
  test_resource Bufu.UserReview, id: 20564, deck: "130 hours."
  test_resource Bufu.Video, id: 11434, user: "drewbert"
  test_resource Bufu.VideoShow, id: 3, name: "Quick Looks"
end
