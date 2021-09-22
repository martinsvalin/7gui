module TemperatureConverter exposing (main)

import Browser exposing (Document, UrlRequest, application)
import Browser.Navigation exposing (Key)
import Html exposing (Html, form, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)
import Url exposing (Url)


type alias Model =
    Celcius


main : Program Flags Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = onUrlRequest
        , onUrlChange = onUrlChange
        }



-- Model


type alias Flags =
    ()


type alias Celcius =
    Float


type alias Fahrenheit =
    Float


init : Flags -> Url -> Key -> ( Celcius, Cmd msg )
init _ _ _ =
    ( 0, Cmd.none )


toCelcius : Fahrenheit -> Celcius
toCelcius f =
    (f - 32) * 5 / 9


toFahrenheit : Celcius -> Fahrenheit
toFahrenheit c =
    c * 9 / 5 + 32



-- Update


type Msg
    = ConvertToFahrenheit String
    | ConvertToCelcius String
    | Noop


update : Msg -> Celcius -> ( Celcius, Cmd Msg )
update msg celcius =
    case msg of
        ConvertToCelcius newFahrenheit ->
            ( String.toFloat newFahrenheit
                |> Maybe.map toCelcius
                |> Maybe.withDefault celcius
            , Cmd.none
            )

        ConvertToFahrenheit newCelcius ->
            ( String.toFloat newCelcius
                |> Maybe.withDefault celcius
            , Cmd.none
            )

        Noop ->
            ( celcius, Cmd.none )



-- Subscriptions


subscriptions : Celcius -> Sub Msg
subscriptions _ =
    Sub.none



-- View


view : Celcius -> Document Msg
view model =
    { title = "Convert temperature", body = body model }


body : Celcius -> List (Html Msg)
body celcius =
    [ form []
        [ input [ onInput ConvertToFahrenheit, value (String.fromFloat celcius) ] []
        , text "Celcius = "
        , input [ onInput ConvertToCelcius, value (String.fromFloat (toFahrenheit celcius)) ] []
        , text "Fahrenheit"
        ]
    ]



-- Navigation


onUrlRequest : UrlRequest -> Msg
onUrlRequest _ =
    Noop


onUrlChange : Url -> Msg
onUrlChange _ =
    Noop
