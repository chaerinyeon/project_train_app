# 앱 설명
 
### 사용자는 출발역과 도착역을 선택하고, 좌석을 예매할 수 있습니다. 출발역과 도착역은 동일할 수 없습니다.

# 기능

## 1. HomePage
###  출발역 선택 : 
##### 출발역 선택을 터치하면 StatioListPage로 이동합니다. 
##### StationListPage에서 역을 선택하면 초기상태의 '선택' 문구가 선택한 역으로 변경됩니다.
### 도착역 선택 : 
##### 도착역 선택을 터치하면 StatioListPage로 이동합니다. 
##### StationListPage에서 역을 선택하면 초기상태의 '선택' 문구가 선택한 역으로 변경됩니다.

##### 이때 출발역과 도착역은 동일할 수 없다.

### 좌석예매 :
##### 출발역과 도착역을 모두 선택할 시에만 SeatPage로 이동합니다.


## 2. StationListPage
##### 기차역 리스트 : 수서, 동탄, 평택지제, 천안아산, 오송, 대전, 김천구미, 동대구, 경주, 울산, 부산 을 고정된 값으로 출력합니다.
##### 각 기차역 이름을 터치하면 해당 역 이름을 반환하고 이전 페이지로 돌아갑니다. HomePage의 출발역 또는 도착역이 업데이트됩니다.


## 3.SeatPage
#### HomePage 에서 선택한 출발역과 도착역을 출력합니다.
### 좌석 상태 안내 : 
##### 선택한 좌석, 선택이 가능한 좌석, 선택이 불가능한 좌석의 색상을 안내합니다.
### 좌석 위젯 :
##### 초기상태에는 흰색, 좌석 터치 시 색상은 보라색으로 변경됩니다.
### 예매하기 버튼 : 
##### 선택된 좌석이 없으면 아무런 반응이 없고, 선택한 좌석이 있으면 터치 시 showCupertinoDialog 와 함께 선택 한 좌석의 seatID가 출력됩니다
###### - 취소 : Dialog 제거, - 확인 : HomePage로 이동합니다.


# 기술
### Flutter, Dart

# 다트테마 지원
### 다트테마를 지원합니다,


# App description
### 
### Users can select departure and arrival stations and reserve seats. The departure and arrival stations cannot be the same.

# function

## 1. HomePage
### Select departure station: 
##### Touch the selection of departure station to go to StationListPage. 
##### When you select a station in StationListPage, the initial 'Select' text changes to the selected station.
### Select destination station: 
##### Touch the selection of arrival station to go to StationListPage. 
##### When you select a station in StationListPage, the initial 'Select' text changes to the selected station.

##### In this case, the departure station and arrival station cannot be the same.

### Seat reservation:
##### You will be moved to the SeatPage only when you select both the departure and arrival stations.


## 2. StationListPage
### Train station list: Suseo, Dongtan, Pyeongtaekjije, Cheonan Asan, Osong, Daejeon, Gimcheon Gumi, Dongdaegu, Gyeongju, Ulsan, and Busan are printed at fixed values.
### Touch each train station name to return the station name and return to the previous page. Homepage's departure or arrival stations will be updated.


## 3.SeatPage
#### Outputs the selected departure and arrival stations on the HomePage.
### SEAT CONDITION GUIDE: 
##### It guides you to the colors of the selected seats, selectable seats, and non-selectable seats.
### Seat Widget:
##### The initial state changes to white and the color changes to purple when the seat is touched.
### Book button: 
##### If there is no seat selected, there is no response, and if there is a seat selected, the seat ID of the selected seat will be printed with the showCupertinoDialog when touched
 - Cancel : Remove Dialog, - OK : Go to Home Page.


# Technology
### Flutter, Dart

# Dart theme support
### It supports the dart theme,






