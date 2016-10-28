import Html exposing (Html, div, span, text)
import Html.App exposing (beginnerProgram)
import Svg exposing (Svg, svg, circle, g)
import Svg.Attributes exposing (width, height, cx, cy, r, viewBox, stroke, fill, strokeWidth)
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
    { coefficients = [3, 2, 1] }


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

        circles = circlesFrom model.coefficients
    in
        svg [ width "480", height "480", viewBox box ]
            [
              g [ stroke "black", fill "none", strokeWidth "1%" ]
              circles
            ]


circlesFrom : List Int -> List (Svg Message)
circlesFrom coefficients =
    let
        circler radius =
            circle [ cx "0", cy "0", r (toString radius) ] []
    in
        List.map circler coefficients
