/*
 * Copyright (c) 2016 Mastercard
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package lk.directpay.flutter_mpgs.MPGS;

public class GatewayException extends Exception {

    int statusCode;
    GatewayMap error;

    public GatewayException() {
    }

    public GatewayException(String message) {
        super(message);
    }


    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public GatewayMap getErrorResponse() {
        return error;
    }

    public void setErrorResponse(GatewayMap error) {
        this.error = error;
    }
}
