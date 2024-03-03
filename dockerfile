# Use the official .NET Core SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Set the working directory inside the container
WORKDIR /workshop

# Copy the project files into the container
COPY workshop/src /usr/share

# Restore dependencies
RUN dotnet restore

# Build the application
RUN dotnet publish -c Release -o out

# Create a new stage for the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime

# Set the working directory inside the container
WORKDIR /app


# Expose the port the application runs on
EXPOSE 5000

