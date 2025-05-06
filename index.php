<!-- index.php for Render-compatible RSS-Bridge deployment -->
<?php
// Set default timezone
date_default_timezone_set('UTC');

// Enable error reporting for debugging
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Autoload core and bridges
require_once __DIR__ . '/lib/rssbridge.php';

// Run application
try {
    $rssBridge = new RSSBridge();
    $rssBridge->run();
} catch (Exception $e) {
    http_response_code(500);
    echo 'Bridge error: ' . $e->getMessage();
    exit;
}
