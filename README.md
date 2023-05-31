![Build](https://github.com/BerkeleyLibrary/galc-api/actions/workflows/build.yml/badge.svg)

# galc-api

An API for the UC Berkeley Library [Graphic Arts Loan
Collection](https://www.lib.berkeley.edu/visit/morrison/galc).

For the GALC user interface, see the [`galc-ui`](/BerkeleyLibrary/galc-ui)
repository.

## Architecture

`galc-api` is by and large a conventional database-backed Rails
[API-only application](https://guides.rubyonrails.org/api_app.html).
Areas in which it deviates from typical Rails practice include
authentication / authorization (which uses [JSON Web Tokens](https://jwt.io)
rather than session cookies), JSON serialization (which follows the
[JSON:API](https://jsonapi.org/) specification, rather than using Rails'
default JSON serialization), and the handling of image files (which are
managed on the filesystem rather than via ActiveStorage or similar
mechanisms). Details on each of these areas are provided below.

### RESTful Endpoints

#### Persistent resources

The application provides RESTful endpoints for the following resources,
represented by conventional ActiveRecord database models:

| Endpoint    | Model                              | Description                                             |
|-------------|------------------------------------|---------------------------------------------------------|
| `/items`    | [`Item`](app/models/Item.rb)       | Items (i.e. prints) in the GALC collection              |
| `/images`   | [`Image`](app/models/Image.rb)     | Images of prints for display in search results          |
| `/facets`   | [`Facet`](app/models/Facet.rb)     | Search facets (read-only)                               |
| `/terms`    | [`Term`](app/models/Term.rb)       | Controlled vocabulary search terms (read-only)          |
| `/closures` | [`Closure`](app/models/Closure.rb) | Periods when the GALC collection is closed to checkouts |

Note that the `/items` endpoint accepts both faceted search terms
and arbitrary keywords as `filter` parameters following the [JSON:API
Filtering Recommentation](https://jsonapi.org/recommendations/#filtering),
and also accepts pagination paramters following the [JSON:API pagination
spec](https://jsonapi.org/format/#fetching-pagination).

#### Synthetic resources

In addition, the following endpoints appear as RESTful resources, but
are not represented in the database:

| Endpoint        | Description                                   |
|-----------------|-----------------------------------------------|
| `/reservations` | Requests to reserve a GALC print (write-only) |
| `/users`        | Application users (current user only)         |
| `/build_info`   | Build information (read only)                 |

##### Reservations

Clients can POST a request to create a reservation,
which returns the created reservation as a JSON object. However,
reservations are not stored in the databse; "creating" a reservation
simply sends an email to the configured reservation email address
(set via the `$RESERVE_EMAIL_TO` environment variable).

##### Users

Cross-site cookie issues prevent using a conventional Rails
session to manage login state. Instead, authentication/authorization
information is sent with each request via an encrypted
[JSON Web Token](https://jwt.io) in the HTTP `Authorization` header.
If this token is present, clients can GET the current user either by
UID or by the special value `current` — decrypting the token and
returning the user information as a JSON object. (Note that the UID
is only accepted if it matches the ID encoded in the token.)

##### Build information

Build information ([`BuildInfo`](app/lib/build_info.rb)) is captured in
environment variables during the Docker image build process, and returned
by this endpoint in JSON format.

### Non-RESTful endpoints

In addition, the following non-RESTful endpoints are implemented by
[`AuthController`](app/controllers/auth_controller.rb):

| Endpoint                | Description                                                                                                                           |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------| 
| `/auth/calnet/callback` | Callback URL for CalNet login                                                                                                         |                                                             | 
| `/logout`               | Target URL for redirecting to CalNet logout                                                                                           |
| `/`                     | A static webpage providing the [`galc-ui`](/BerkeleyLibrary/galc-ui) interface for testing; enabled only when `$SERVE_TEST_UI` is set |

### Authentication and authorization

**TO DO**

### JSON serialization

**TO DO**

### Image file handling

**TO DO**

## Build, packaging, and deployment

**TO DO**

