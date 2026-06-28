error en refapart 

## Error Type
Console Error

## Error Message
Gateway response error {}


    at gatewayRequest (lib/api/gateway-client.ts:185:15)
        at async register (features/auth/services/auth-service.ts:41:3)
            at async handleSubmit (app/register/page.tsx:38:7)

            ## Code Frame
              183 |     const shouldLogError = !suppressErrorLog && !silentStatuses.includes(response.status);
                184 |     if (showTechnicalErrors && shouldLogError) {
                > 185 |       console.error("Gateway response error", {
                      |               ^
                        186 |         path,
                          187 |         applicationCode,
                            188 |         status: response.status,

                            Next.js version: 15.5.19 (Turbopack)
                            s