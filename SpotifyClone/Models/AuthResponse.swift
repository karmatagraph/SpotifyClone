//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by karma on 7/28/22.
//

import Foundation

struct AuthResponse: Codable {
    // Auth response
    /*
     
    {
        "access_token" = "BQCyPAI3EaqSRDLbDF6aAIsC8PgL_xEPnLpz1AF03i18FzsTOxhZmNam__4NrgWD9FA9Tt2mc59c1JJMNWDStwc12s02LOhZWnfRfYGVT-HjH0GW38wd1ClXx-coflmhmyMPvUHeRI4YBw7lSLBG9s8HX55quuMkVZHN8fK_qXEsiX9BHtwijp0pSsF1MHAstsi896Cz8qq8BOA";
        "expires_in" = 3600;
        "refresh_token" = "AQBc7rRn00VoxN3m3Ge5FBusSQ5GoGk5JGAUs0R9Y4fzTM-Q4nJEr0j3jDOyAyO6iT_WUPRhipSYrDTGYZUt_BEzollOmkfIwaRPkECOPke5kwtPfqf-ieMLFIRnhF5imvM";
        scope = "user-read-private";
        "token_type" = Bearer;
    }
    */
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String?
    let scope: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
    
}
