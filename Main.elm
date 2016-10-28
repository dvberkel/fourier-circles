import Html exposing (Html, div, span, text)
import Html.App exposing (beginnerProgram)
import Svg exposing (svg, circle)
import Svg.Attributes exposing (width, height, cx, cy, r, viewBox)
import String

main : Program Never
main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    {
        coefficients: List Int
    }


model : Model
model =
    { coefficients = [1, 2] }


type Message =
    Nothing


update : Message -> Model -> Model
update message model =
    model


view : Model -> Html Message
view model =
    let
        maximum = List.sum model.coefficients

        viewBoxValues = [-maximum, -maximum, 2*maximum, 2*maximum]

        viewBoxStrings = List.map toString viewBoxValues

        box = String.join " " viewBoxStrings
    in
        svg [ width "480", height "480", viewBox box ]
            [
             circle [ cx "0", cy "0", r "1" ] []
            ]
