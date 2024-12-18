FROM haskell:latest

# Install stack
RUN curl -sSL https://get.haskellstack.org/ | sh

WORKDIR /app
COPY . /app

# Build Duckling
RUN stack setup
RUN stack build

# Expose the port Duckling runs on
EXPOSE 8000

# Run the Duckling example server on port 8000
CMD ["stack", "exec", "duckling-example-exe", "--", "--port", "8000"]