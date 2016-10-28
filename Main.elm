import Html exposing (Html, div, span, text)
import Html.App exposing (beginnerProgram)
import Svg exposing (svg, circle)
import Svg.Attributes exposing (width, height, cx, cy, r)

main : Program Never
main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    {
        coefficients: List Int
    }


model : Model
model =
    { coefficients = [1] }


type Message =
    Nothing


update : Message -> Model -> Model
update message model =
    model


view : Model -> Html Message
view model =
    let
        radius = toString (100 * sum model.coefficients)
    in
        svg [ width "480", height "480" ]
            [
             circle [ cx "0", cy "0", r radius ] []
            ]


sum : List Int -> Int
sum elements =
    case elements of
        [] ->
            0

        x::xs ->
            x + sum xs
