FROM haskell:8

# Install curl and certificates if needed
RUN apt-get update && apt-get install -y curl ca-certificates

WORKDIR /app
COPY . /app

# Install Stack
RUN curl -sSL https://get.haskellstack.org/ | sh

RUN stack setup && stack build
EXPOSE 8000
CMD ["stack", "exec", "duckling-example-exe", "--", "--port", "8000"]