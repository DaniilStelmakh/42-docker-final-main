# указываем родительсикй образ
FROM golang:1.22.5 
# создаем каталог внутри создаваемого образа 
# (для простоты, указываем, что все последующие команды будут выполнятся в нем)
WORKDIR /app 
# копирование мудулей для удачной компиляции 
COPY go.mod go.sum ./ 
# команда для запуска, после ее выполнения все все модули Go
# указанные в go.mod и go.sum будут установлены в каталог /app
RUN go mod download 
# копируем все файлы с расширением .go 
#
COPY *.go ./ 
# для компиляции приложения 
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-42-final
# команда, когда Docker - образ используется для запуска контейнера 
CMD [ "/docker-42-final" ]
