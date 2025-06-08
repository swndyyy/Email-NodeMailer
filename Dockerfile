# Menggunakan Node.js LTS sebagai base image
FROM node:18-bullseye-slim

# Direktori kerja di dalam container
WORKDIR /usr/src/app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Instal dependensi
RUN npm install --production

# Salin semua file proyek ke dalam container
COPY . .

# Expose port (Hugging Face Spaces menentukan port via environment variable)
ENV PORT=3000
EXPOSE 3000

# Menjalankan aplikasi
CMD ["npm", "start"]