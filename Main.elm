import Html exposing (Html, div, span, text)
import Html.App exposing (beginnerProgram)


main : Program Never
main =
    beginnerProgram { model = model, view = view, update = update }


type alias Model =
    {
        coefficients: List Int
    }


model : Model
model =
    { coefficients = [0] }


type Message =
    Nothing


update : Message -> Model -> Model
update message model =
    model


view : Model -> Html Message
view model =
    let
        coefficients = viewCoefficients model.coefficients
    in
        div [] coefficients


viewCoefficients : List Int -> List (Html Message)
viewCoefficients coefficients =
    List.map viewCoefficient coefficients


viewCoefficient : Int -> Html Message
viewCoefficient coefficient =
    span [] [ text (toString coefficient) ]

