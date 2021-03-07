'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/index": "2ad86030853bfc25d6672f115f5964d8",
".git/ORIG_HEAD": "c95c6ed6a5944782379b94abbc0ec69f",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/FETCH_HEAD": "524fe86a49089c41c083f55d7c350592",
".git/config": "c78266403edfb01ddc5dff922079ea39",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/fsmonitor-watchman.sample": "db4d62db2039e4bec38baa7567788284",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/objects/pack/pack-ad3ff382adbe2fa1b81bdbf3faeb559f4d5f3e6a.idx": "15fb53ae45caa17352ccd5664f4c61d0",
".git/objects/pack/pack-ad3ff382adbe2fa1b81bdbf3faeb559f4d5f3e6a.pack": "ee7034aad63f341d7a74d5071dc25f87",
".git/objects/69/a446a9c3b32b1c17a0fdddcd18128169cf8355": "e69822188836cf7dec24cd288ffceb0a",
".git/refs/remotes/origin/main": "09709fad863cf601dfc6ef1f994a39a2",
".git/refs/remotes/origin/gh-pages": "aa56beb67c5d29163e21b19a0f4a06da",
".git/refs/heads/gh-pages": "aa56beb67c5d29163e21b19a0f4a06da",
".git/refs/tags/v1.1.1": "21da4ad2839be7429cc9bd87f26d5b8b",
".git/refs/tags/v0.0.1": "3efab2a8de7d2dec5a78857a7fcc9f60",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "f6be91d6004de70e1b810ed1c4ed6142",
".git/logs/refs/remotes/origin/main": "e5f1fa9408937e9e36c33d99dcc02a60",
".git/logs/refs/remotes/origin/gh-pages": "43efd44e5f3a42602e01b05a8d211a64",
".git/logs/refs/heads/gh-pages": "f6be91d6004de70e1b810ed1c4ed6142",
".git/COMMIT_EDITMSG": "01eb2c11c2685e04a0e3b0556549b914",
"favicon.png": "5110bf3f3e943303f4d2c4957095b548",
"index.html": "a468604fc6f520b34d176fbb6a2526c1",
"/": "a468604fc6f520b34d176fbb6a2526c1",
"manifest.json": "5e5805cfa1362a72ae87cc3495ad29e9",
"main.dart.js_3.part.js": "b2c05f9557a29242803a5a24495dda43",
"assets/assets/responses/paths/p3.json": "f264f44a8f5be85abb2312f284b0f874",
"assets/assets/responses/paths/p2.json": "b48c41d2bc8994b3a6c67f4701ece52a",
"assets/assets/responses/paths/p5.json": "b1e0379bede663a9636191713d99d0b7",
"assets/assets/responses/paths/p1.json": "636c6b882d1bc536936f82ed1e4f7299",
"assets/assets/responses/paths/p4.json": "fdad7f6e1b0e55099fe99b7570bf0fec",
"assets/assets/responses/files/f2.json": "4f853e9219d6a91e67d29a4743cfa744",
"assets/assets/responses/files/f8.json": "9606779fe5c939d7a701bd28af4b9bc9",
"assets/assets/responses/files/f10.json": "4f74d536097e3aaeba02f6be47fe1a3d",
"assets/assets/responses/files/f9.json": "6097ba7134db65d27447e7697370c898",
"assets/assets/responses/files/f7.json": "f8404d18a2f2dd3bea1deb917ff0c747",
"assets/assets/responses/files/f3.json": "3d2f74026bac0d8577d898b9b9ab0a31",
"assets/assets/responses/files/f5.json": "a73bc468c64aeed64bee01501935c901",
"assets/assets/responses/files/f6.json": "da0574d85b25a717379c660eb32471e6",
"assets/assets/responses/files/f4.json": "d2112a77225c6a4fc5a1b3a8e88f12b5",
"assets/assets/responses/files/f1.json": "81528f5575eec378a5ad635fc53c3d6f",
"assets/assets/response.json": "1f08d903e0639fe25fe8636cf0915d33",
"assets/AssetManifest.json": "1acc078b3fc10327dad1e81b6f8d8062",
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
"main.dart.js": "598478f9de131ad4fc53067d6747f1a9",
"version.json": "3c19442a0ddfd7a3a6feb3ab1b2c39de",
"main.dart.js_2.part.js": "a13346a57f3b6547a8794c251fee283f",
"main.dart.js_1.part.js": "68ef30e4eb2b3539c2b46a8ce4a1f6dc",
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
