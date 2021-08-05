# Step 1
FROM tiangolo/node-frontend:10 as build-stage

COPY package*.json .

RUN npm install --silent

COPY . .

# build  app
RUN npm run build

FROM nginx:1.19

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/build/ /usr/share/nginx/html

# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY --from=build /nginx.conf /etc/nginx/conf.d/default.conf






