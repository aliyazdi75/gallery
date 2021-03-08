'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5110bf3f3e943303f4d2c4957095b548",
"index.html": "b8604f63fdc41e458f47db2a5f32512e",
"/": "b8604f63fdc41e458f47db2a5f32512e",
"manifest.json": "5e5805cfa1362a72ae87cc3495ad29e9",
"main.dart.js_3.part.js": "75a4d9563458afa0088969eac101481c",
"assets/assets/responses/photos/photo2.json": "4f853e9219d6a91e67d29a4743cfa744",
"assets/assets/responses/photos/photo1.json": "81528f5575eec378a5ad635fc53c3d6f",
"assets/assets/responses/photos/photo9.json": "6097ba7134db65d27447e7697370c898",
"assets/assets/responses/photos/photo8.json": "9606779fe5c939d7a701bd28af4b9bc9",
"assets/assets/responses/photos/photo5.json": "a4038f045a14cc806f32828ae62736ed",
"assets/assets/responses/photos/photo3.json": "3d2f74026bac0d8577d898b9b9ab0a31",
"assets/assets/responses/photos/photo7.json": "f8404d18a2f2dd3bea1deb917ff0c747",
"assets/assets/responses/photos/photo10.json": "4f74d536097e3aaeba02f6be47fe1a3d",
"assets/assets/responses/photos/photo4.json": "d2112a77225c6a4fc5a1b3a8e88f12b5",
"assets/assets/responses/photos/photo6.json": "da0574d85b25a717379c660eb32471e6",
"assets/assets/responses/albums/album1.json": "e2fd0e8c9383418efddbdabe1a584c4e",
"assets/assets/responses/albums/album5.json": "745210018885115d64c19c1798988523",
"assets/assets/responses/albums/album3.json": "cb8f6cdf88c0f9e7724afda489f4db47",
"assets/assets/responses/albums/album2.json": "650bf29eba3f4b4f8c1f24e92bd57343",
"assets/assets/responses/albums/album4.json": "3d3563564e40ba3697160c98e154c808",
"assets/AssetManifest.json": "ca56f65dff7a036c4e7724cb02967b2b",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/google_fonts/Montserrat-SemiBold.ttf": "c641dbee1d75892e4d88bdc31560c91b",
"assets/fonts/google_fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/google_fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/fonts/google_fonts/Oswald-SemiBold.ttf": "2ee37ae7584a4656fd16062217b39cae",
"assets/fonts/google_fonts/Montserrat-Medium.ttf": "c8b6e083af3f94009801989c3739425e",
"assets/fonts/google_fonts/Oswald-Medium.ttf": "c76a8d044f123462ba5c08ea47b56e21",
"assets/fonts/IRANSans-Regular.ttf": "98129cf8e9296dc4568d2fc8a224fe43",
"assets/fonts/IRANSans-Medium.ttf": "77506786a80fdbc188d33c16726f6924",
"assets/fonts/IRANSans-SemiBold.ttf": "904b8ac65b457fe5f22d4dc8fe152fed",
"assets/fonts/IRANSans-Bold.ttf": "2b1fab0906a9cdb19e7ecfb779e50b78",
"assets/NOTICES": "0b05fafbfe445b3bf0e03bb60f31c34c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "cd7ad3eb14be212352bcc42188a5c287",
"README.md": "d2c399aa42f69575a56a7cf418e4d49b",
"icons/Icon-512.png": "f0e62485a6cdd66f29a128704d5b38b0",
"icons/Icon-192.png": "b2a4d07e65d8e3f35012cdf8f68f3a53",
"main.dart.js": "e07782aef2e3a4f32a472a3fd4bcb4ab",
"version.json": "3c19442a0ddfd7a3a6feb3ab1b2c39de",
"main.dart.js_2.part.js": "a72336816cc51e8eea884613c49df356",
"main.dart.js_1.part.js": "ed4bbe06312c423f911322ca8e010a38",
"404.html": "d730a91a722af16c228746c77e7975bb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
