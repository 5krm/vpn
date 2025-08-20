import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import { resolve } from 'path';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
    css: {
        preprocessorOptions: {
            scss: {
                includePaths: ['node_modules']
            }
        }
    },
    resolve: {
        alias: {
            '~bootstrap': resolve(__dirname, 'node_modules/bootstrap'),
            '~bootstrap-icons': resolve(__dirname, 'node_modules/bootstrap-icons'),
            '~datatables.net-bs5': resolve(__dirname, 'node_modules/datatables.net-bs5'),
            '~datatables.net-buttons-bs5': resolve(__dirname, 'node_modules/datatables.net-buttons-bs5'),
            '~datatables.net-select-bs5': resolve(__dirname, 'node_modules/datatables.net-select-bs5')
        }
    }
});
